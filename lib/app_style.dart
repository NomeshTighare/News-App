import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color KWhite = Color(0xffffffff);
const Color KLightWhite = Color(0xffeff5f4);
const Color KLighterWhite = Color.fromARGB(255, 251, 249, 249);

const Color KGray = Color(0xfff9397a0);
const Color KLightGray = Color(0xffa7a7a7);

const Color KBlue = Color(0xff5474fd);
const Color KLightBlue = Color(0xff83b1ff);
const Color KLighterBlue = Color(0xffc1d4f9);

const Color KDarkBlue = Color(0xff19202d);

const double KBorderRadius = 16.0;

final KBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(KBorderRadius),
    borderSide: BorderSide.none);

final KPoppinsBold =
    GoogleFonts.poppins(color: KDarkBlue, fontWeight: FontWeight.w700);

final KPoppinsSemiBold =
    GoogleFonts.poppins(color: KDarkBlue, fontWeight: FontWeight.w600);

final KPoppinsMedium =
    GoogleFonts.poppins(color: KDarkBlue, fontWeight: FontWeight.w500);

final KPoppinsRegular =
    GoogleFonts.poppins(color: KDarkBlue, fontWeight: FontWeight.w400);
