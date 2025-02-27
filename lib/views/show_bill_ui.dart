import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowBillUI extends StatefulWidget {
  double? payTotal;
  File? imgFile;
  ShowBillUI({super.key, this.payTotal, this.imgFile});

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
              'Total: ${widget.payTotal}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
