import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowBillUI extends StatefulWidget {
  double? payTotal;
  File? imgFile;
  int? adult;
  int? child;
  int? coke;
  int? pure;

  ShowBillUI({
    super.key,
    this.payTotal,
    this.imgFile,
    this.adult,
    this.child,
    this.coke,
    this.pure,
  });

  @override
  State<ShowBillUI> createState() => _ShowBillUIState();
}

class _ShowBillUIState extends State<ShowBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Image.file(widget.imgFile!, height: 200),
            SizedBox(height: 20),
            Text(
              'ทั้งหมด ${widget.payTotal} บาท',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'ผู้ใหญ่ ${widget.adult} คน',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'เด็ก ${widget.child} คน',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'โค้ก ${widget.coke} ขวด',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'น้ำเปล่า ${widget.pure} ขวด',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
