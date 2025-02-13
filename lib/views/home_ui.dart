import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // ตัวควบคุม AnimatedNotchBottomBar
  NotchBottomBarController _pageController = NotchBottomBarController(index: 1);

  // สร้างตัวแปรเก็บหน้าจอที่จะแสดงที่ body ซึ่งต่อกับ AnimatedNotchBottomBar
  List<Widget> viewInBody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];

  // สร้างตัวแปรเก็บ Index เก็บหน้าจอที่จะแสดง
  int indexShow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'SAU Buffet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            indexShow = valueParam;
          });
        },
        kIconSize: 24,
        kBottomRadius: 20,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        itemLabelStyle: TextStyle(
          color: Colors.white,
        ),
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: const Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'เมนู',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInBody[indexShow],
    );
  }
}
