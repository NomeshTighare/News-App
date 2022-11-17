import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/category.dart';

import 'HomeScreen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _page = 0;
  PageController? _pageController;
  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[HomeScreen(), Category()];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: KWhite,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'News App',
            style: GoogleFonts.poppins(
              color: KDarkBlue,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: KLighterWhite,
        body: Center(
          child: pages.elementAt(_page),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: KWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _page == 0
                  ? Icon(
                      EvaIcons.home,
                      color: KDarkBlue,
                    )
                  : Icon(
                      EvaIcons.homeOutline,
                      color: KDarkBlue,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _page == 1
                  ? Icon(
                      EvaIcons.bookmark,
                      color: KDarkBlue,
                    )
                  : Icon(
                      EvaIcons.bookmarkOutline,
                      color: KDarkBlue,
                    ),
              label: '',
            ),
          ],
          currentIndex: _page,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
