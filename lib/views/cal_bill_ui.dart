import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "package:flutter/services.dart";
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  // สร้างตัวแปรไปใช้กับผู้ใหญ่/เด็ก
  bool adultCheck = false;
  bool childCheck = false;

  // สร้างแปรเพื่อใช้กับบุฟเฟต์น้ำดื่ม
  int drinkCheck = 1;

  // ตัวควบคุม Textfield
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');

  // สร้างตัวแปรเก็บประเภทสมาชิก
  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไปลด 5%',
    'สมาชิก VIP ลด 20%',
  ];

  // สร้างตัวแปรเก็บส่วนลดประเภทสมาชิก
  double discount = 0.0;
  double selectDiscount = 0.0;

  // สร้าง method เปิดกล้องเพื่อถ่ายรูป
  File? imgFile;

  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );

    if (picker == null) return;
    setState(() {
      imgFile = File(picker.path);
    });
  }

  showWarningDialog(context, message) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('ตกลง'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 100,
                        )
                      : Image.file(
                          imgFile!,
                          height: 100,
                        ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Checkbox(
                      value: adultCheck,
                      onChanged: (valueParam) {
                        setState(() {
                          adultCheck = valueParam!;
                          if (valueParam == false) {
                            adultCtrl.text = '0';
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        'ผู้ใหญ่ 299 บาท/คน จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        enabled: adultCheck,
                        controller: adultCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Text('คน')
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: childCheck,
                      onChanged: (valueParam) {
                        setState(() {
                          childCheck = valueParam!;
                          if (valueParam == false) {
                            childCtrl.text = '0';
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        'เด็ก 69 บาท/คน จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        enabled: childCheck,
                        controller: childCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Text('คน')
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟ่ต์น้ำดื่ม',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          drinkCheck = valueParam!;
                          if (drinkCheck == 1) {
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: drinkCheck,
                    ),
                    Text('รับ 25 บาท/หัว')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          drinkCheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: drinkCheck,
                    ),
                    Text('ไม่รับ')
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tโค้ก 20 บาท/ขวด จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        enabled: drinkCheck == 1 ? false : true,
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Text('ขวด')
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tน้ำเปล่า 15 บาท/ขวด จำนวน',
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        enabled: drinkCheck == 1 ? false : true,
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Text('ขวด')
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // DropDown ประเภทสมาขิก
                DropdownButton(
                  value: selectDiscount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem<double>(
                          value: memberType.indexOf(e).toDouble(),
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    int index = valueParam!.toInt();
                    setState(() {
                      selectDiscount = valueParam;
                      switch (index) {
                        case 0:
                          discount = 0.00;
                          break;
                        case 1:
                          discount = 0.05;
                          break;
                        case 2:
                          discount = 0.20;
                          break;
                        default:
                          discount = 0.00;
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                // ปุ่มคำนวณและยกเลิก วางในแนวนอน
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                          icon: Icon(Icons.calculate),
                          label: Text('คํานวณ'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 50),
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            //validate
                            if (imgFile == null) {
                              showWarningDialog(context,
                                  'กรุณาใส่รูปโปรไฟล์ก่อนดำเนินการต่อ');
                              return;
                            } else if (adultCheck == true &&
                                    adultCtrl.text == '0' ||
                                adultCtrl.text.isEmpty) {
                              showWarningDialog(
                                  context, 'ป้อนจำนวนผู้ใหญ่ไม่ครบ');
                              return;
                            } else if (childCheck == true &&
                                    childCtrl.text == '0' ||
                                childCtrl.text.isEmpty) {
                              showWarningDialog(context, 'ป้อนจำนวนเด็กไม่ครบ');
                              return;
                            }
                            int adult = int.parse(adultCtrl.text);
                            int child = int.parse(childCtrl.text);
                            int coke = int.parse(cokeCtrl.text);
                            int pure = int.parse(pureCtrl.text);
                            double payWaterBuffet =
                                drinkCheck == 1 ? 25.0 * (adult + child) : 0;
                            double payTotal = (payWaterBuffet +
                                (adult * 299) +
                                (child * 69) +
                                (coke * 20) +
                                (pure * 15));
                            // สิ่งที่ต้องจ่ายทั้งหมด
                            payTotal = payTotal - (payTotal * discount);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowBillUI(
                                  payTotal: payTotal,
                                  imgFile: imgFile,
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.cancel),
                        label: Text('ยกเลิก'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 50),
                          backgroundColor: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            // Reset all values to their default states
                            imgFile = null;
                            adultCheck = false;
                            childCheck = false;
                            drinkCheck = 1;
                            adultCtrl.text = '0';
                            childCtrl.text = '0';
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                            discount = 0.0;
                            selectDiscount = 0.0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
