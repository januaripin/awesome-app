import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class Themes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.lightGrey,
    primarySwatch: AppColors.orange,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.lightGrey,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    textTheme: lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.orange),
      ),
    ),
  );

  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkGrey,
    ),
    caption: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.grey,
    ),
    overline: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkGrey,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 56.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}
