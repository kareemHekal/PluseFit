import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  // Font Sizes
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s24 = 24;
  static const double s25 = 25;
  static const double s28 = 28;
  static const double s30 = 30;

  // Helper method (Named Parameters)
  static TextStyle _style({required double size, required FontWeight weight}) =>
      GoogleFonts.balooThambi2(fontSize: size, fontWeight: weight);

  // Regular
  static final regular10 = _style(size: s10, weight: FontWeight.w400);
  static final regular12 = _style(size: s12, weight: FontWeight.w400);
  static final regular14 = _style(size: s14, weight: FontWeight.w400);
  static final regular16 = _style(size: s16, weight: FontWeight.w400);
  static final regular18 = _style(size: s18, weight: FontWeight.w400);
  static final regular20 = _style(size: s20, weight: FontWeight.w400);
  static final regular22 = _style(size: s22, weight: FontWeight.w400);
  static final regular24 = _style(size: s24, weight: FontWeight.w400);
  static final regular25 = _style(size: s25, weight: FontWeight.w400);
  static final regular28 = _style(size: s28, weight: FontWeight.w400);
  static final regular30 = _style(size: s30, weight: FontWeight.w400);

  // Medium
  static final medium10 = _style(size: s10, weight: FontWeight.w500);
  static final medium12 = _style(size: s12, weight: FontWeight.w500);
  static final medium14 = _style(size: s14, weight: FontWeight.w500);
  static final medium16 = _style(size: s16, weight: FontWeight.w500);
  static final medium18 = _style(size: s18, weight: FontWeight.w500);
  static final medium20 = _style(size: s20, weight: FontWeight.w500);
  static final medium22 = _style(size: s22, weight: FontWeight.w500);
  static final medium24 = _style(size: s24, weight: FontWeight.w500);
  static final medium25 = _style(size: s25, weight: FontWeight.w500);
  static final medium28 = _style(size: s28, weight: FontWeight.w500);
  static final medium30 = _style(size: s30, weight: FontWeight.w500);

  // SemiBold
  static final semiBold10 = _style(size: s10, weight: FontWeight.w600);
  static final semiBold12 = _style(size: s12, weight: FontWeight.w600);
  static final semiBold14 = _style(size: s14, weight: FontWeight.w600);
  static final semiBold16 = _style(size: s16, weight: FontWeight.w600);
  static final semiBold18 = _style(size: s18, weight: FontWeight.w600);
  static final semiBold20 = _style(size: s20, weight: FontWeight.w600);
  static final semiBold22 = _style(size: s22, weight: FontWeight.w600);
  static final semiBold24 = _style(size: s24, weight: FontWeight.w600);
  static final semiBold25 = _style(size: s25, weight: FontWeight.w600);
  static final semiBold28 = _style(size: s28, weight: FontWeight.w600);
  static final semiBold30 = _style(size: s30, weight: FontWeight.w600);

  // Bold
  static final bold10 = _style(size: s10, weight: FontWeight.w700);
  static final bold12 = _style(size: s12, weight: FontWeight.w700);
  static final bold14 = _style(size: s14, weight: FontWeight.w700);
  static final bold16 = _style(size: s16, weight: FontWeight.w700);
  static final bold18 = _style(size: s18, weight: FontWeight.w700);
  static final bold20 = _style(size: s20, weight: FontWeight.w700);
  static final bold22 = _style(size: s22, weight: FontWeight.w700);
  static final bold24 = _style(size: s24, weight: FontWeight.w700);
  static final bold25 = _style(size: s25, weight: FontWeight.w700);
  static final bold28 = _style(size: s28, weight: FontWeight.w700);
  static final bold30 = _style(size: s30, weight: FontWeight.w700);

  // ExtraBold
  static final extraBold10 = _style(size: s10, weight: FontWeight.w800);
  static final extraBold12 = _style(size: s12, weight: FontWeight.w800);
  static final extraBold14 = _style(size: s14, weight: FontWeight.w800);
  static final extraBold16 = _style(size: s16, weight: FontWeight.w800);
  static final extraBold18 = _style(size: s18, weight: FontWeight.w800);
  static final extraBold20 = _style(size: s20, weight: FontWeight.w800);
  static final extraBold22 = _style(size: s22, weight: FontWeight.w800);
  static final extraBold24 = _style(size: s24, weight: FontWeight.w800);
  static final extraBold25 = _style(size: s25, weight: FontWeight.w800);
  static final extraBold28 = _style(size: s28, weight: FontWeight.w800);
  static final extraBold30 = _style(size: s30, weight: FontWeight.w800);
}

/// other version

//import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class AppTextStyle {
//   static const double s10 = 10;
//   static const double s12 = 12;
//   static const double s14 = 14;
//   static const double s16 = 16;
//   static const double s18 = 18;
//   static const double s20 = 20;
//   static const double s22 = 22;
//   static const double s24 = 24;
//   static const double s25 = 25;
//   static const double s28 = 28;
//   static const double s30 = 30;
//
//   // Regular
//   static final regular10 = GoogleFonts.balooThambi2(fontSize: s10, fontWeight: FontWeight.w400);
//   static final regular12 = GoogleFonts.balooThambi2(fontSize: s12, fontWeight: FontWeight.w400);
//   static final regular14 = GoogleFonts.balooThambi2(fontSize: s14, fontWeight: FontWeight.w400);
//   static final regular16 = GoogleFonts.balooThambi2(fontSize: s16, fontWeight: FontWeight.w400);
//   static final regular18 = GoogleFonts.balooThambi2(fontSize: s18, fontWeight: FontWeight.w400);
//   static final regular20 = GoogleFonts.balooThambi2(fontSize: s20, fontWeight: FontWeight.w400);
//   static final regular22 = GoogleFonts.balooThambi2(fontSize: s22, fontWeight: FontWeight.w400);
//   static final regular24 = GoogleFonts.balooThambi2(fontSize: s24, fontWeight: FontWeight.w400);
//   static final regular25 = GoogleFonts.balooThambi2(fontSize: s25, fontWeight: FontWeight.w400);
//   static final regular28 = GoogleFonts.balooThambi2(fontSize: s28, fontWeight: FontWeight.w400);
//   static final regular30 = GoogleFonts.balooThambi2(fontSize: s30, fontWeight: FontWeight.w400);
//
//   // Medium
//   static final medium10 = GoogleFonts.balooThambi2(fontSize: s10, fontWeight: FontWeight.w500);
//   static final medium12 = GoogleFonts.balooThambi2(fontSize: s12, fontWeight: FontWeight.w500);
//   static final medium14 = GoogleFonts.balooThambi2(fontSize: s14, fontWeight: FontWeight.w500);
//   static final medium16 = GoogleFonts.balooThambi2(fontSize: s16, fontWeight: FontWeight.w500);
//   static final medium18 = GoogleFonts.balooThambi2(fontSize: s18, fontWeight: FontWeight.w500);
//   static final medium20 = GoogleFonts.balooThambi2(fontSize: s20, fontWeight: FontWeight.w500);
//   static final medium22 = GoogleFonts.balooThambi2(fontSize: s22, fontWeight: FontWeight.w500);
//   static final medium24 = GoogleFonts.balooThambi2(fontSize: s24, fontWeight: FontWeight.w500);
//   static final medium25 = GoogleFonts.balooThambi2(fontSize: s25, fontWeight: FontWeight.w500);
//   static final medium28 = GoogleFonts.balooThambi2(fontSize: s28, fontWeight: FontWeight.w500);
//   static final medium30 = GoogleFonts.balooThambi2(fontSize: s30, fontWeight: FontWeight.w500);
//
//   // SemiBold
//   static final semiBold10 = GoogleFonts.balooThambi2(fontSize: s10, fontWeight: FontWeight.w600);
//   static final semiBold12 = GoogleFonts.balooThambi2(fontSize: s12, fontWeight: FontWeight.w600);
//   static final semiBold14 = GoogleFonts.balooThambi2(fontSize: s14, fontWeight: FontWeight.w600);
//   static final semiBold16 = GoogleFonts.balooThambi2(fontSize: s16, fontWeight: FontWeight.w600);
//   static final semiBold18 = GoogleFonts.balooThambi2(fontSize: s18, fontWeight: FontWeight.w600);
//   static final semiBold20 = GoogleFonts.balooThambi2(fontSize: s20, fontWeight: FontWeight.w600);
//   static final semiBold22 = GoogleFonts.balooThambi2(fontSize: s22, fontWeight: FontWeight.w600);
//   static final semiBold24 = GoogleFonts.balooThambi2(fontSize: s24, fontWeight: FontWeight.w600);
//   static final semiBold25 = GoogleFonts.balooThambi2(fontSize: s25, fontWeight: FontWeight.w600);
//   static final semiBold28 = GoogleFonts.balooThambi2(fontSize: s28, fontWeight: FontWeight.w600);
//   static final semiBold30 = GoogleFonts.balooThambi2(fontSize: s30, fontWeight: FontWeight.w600);
//
//   // Bold
//   static final bold10 = GoogleFonts.balooThambi2(fontSize: s10, fontWeight: FontWeight.w700);
//   static final bold12 = GoogleFonts.balooThambi2(fontSize: s12, fontWeight: FontWeight.w700);
//   static final bold14 = GoogleFonts.balooThambi2(fontSize: s14, fontWeight: FontWeight.w700);
//   static final bold16 = GoogleFonts.balooThambi2(fontSize: s16, fontWeight: FontWeight.w700);
//   static final bold18 = GoogleFonts.balooThambi2(fontSize: s18, fontWeight: FontWeight.w700);
//   static final bold20 = GoogleFonts.balooThambi2(fontSize: s20, fontWeight: FontWeight.w700);
//   static final bold22 = GoogleFonts.balooThambi2(fontSize: s22, fontWeight: FontWeight.w700);
//   static final bold24 = GoogleFonts.balooThambi2(fontSize: s24, fontWeight: FontWeight.w700);
//   static final bold25 = GoogleFonts.balooThambi2(fontSize: s25, fontWeight: FontWeight.w700);
//   static final bold28 = GoogleFonts.balooThambi2(fontSize: s28, fontWeight: FontWeight.w700);
//   static final bold30 = GoogleFonts.balooThambi2(fontSize: s30, fontWeight: FontWeight.w700);
//
//   // ExtraBold
//   static final extraBold10 = GoogleFonts.balooThambi2(fontSize: s10, fontWeight: FontWeight.w800);
//   static final extraBold12 = GoogleFonts.balooThambi2(fontSize: s12, fontWeight: FontWeight.w800);
//   static final extraBold14 = GoogleFonts.balooThambi2(fontSize: s14, fontWeight: FontWeight.w800);
//   static final extraBold16 = GoogleFonts.balooThambi2(fontSize: s16, fontWeight: FontWeight.w800);
//   static final extraBold18 = GoogleFonts.balooThambi2(fontSize: s18, fontWeight: FontWeight.w800);
//   static final extraBold20 = GoogleFonts.balooThambi2(fontSize: s20, fontWeight: FontWeight.w800);
//   static final extraBold22 = GoogleFonts.balooThambi2(fontSize: s22, fontWeight: FontWeight.w800);
//   static final extraBold24 = GoogleFonts.balooThambi2(fontSize: s24, fontWeight: FontWeight.w800);
//   static final extraBold25 = GoogleFonts.balooThambi2(fontSize: s25, fontWeight: FontWeight.w800);
//   static final extraBold28 = GoogleFonts.balooThambi2(fontSize: s28, fontWeight: FontWeight.w800);
//   static final extraBold30 = GoogleFonts.balooThambi2(fontSize: s30, fontWeight: FontWeight.w800);
// }