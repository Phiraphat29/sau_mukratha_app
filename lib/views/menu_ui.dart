// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  // สร้างตัวแปรเก็บเมนูที่ ListView
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  // สร้างตัวแปรเก็บรูปร้านสาขาที่ ListView
  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  // สร้างตัวแปรเก็บละติจูดกับลองจิจูด
  List<String> shopLocation = [
    'https://www.google.co.th/maps/@18.3131742,99.345329,15z/',
    'https://www.google.co.th/maps/@18.3129297,99.3596198,15z/',
    'https://www.google.co.th/maps/@18.2837523,99.3643303,15z/',
    'https://www.google.co.th/maps/place/@18.213132,99.4713258,15z/',
    'https://www.google.co.th/maps/place/@18.1803595,99.4940941,15z/',
  ];

  // เปิด Browser
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        menuShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShop.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 5,
                    ),
                    child: ClipRRect(
                      child: InkWell(
                        onTap: () {
                          _launchInBrowser(Uri.parse(shopLocation[index]));
                        },
                        child: Image.asset(
                          branchShop[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
