import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_mukratha_app/views/splash_screen_ui.dart';

void main() {
  runApp(MuKraThaSauApp());
}

class MuKraThaSauApp extends StatefulWidget {
  const MuKraThaSauApp({super.key});

  @override
  State<MuKraThaSauApp> createState() => _MuKraThaSauAppState();
}

class _MuKraThaSauAppState extends State<MuKraThaSauApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
