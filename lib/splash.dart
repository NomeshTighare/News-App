import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/HomeScreen.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/mainmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainMenu()));
    });
    // _navigatetologin();
  }

  void _navigatetoMainMenu() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {}).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: KDarkBlue,
        child: Center(
            child: Text(
          'News App',
          style: GoogleFonts.poppins(color: KWhite, fontSize: 40),
        )));
  }
}
