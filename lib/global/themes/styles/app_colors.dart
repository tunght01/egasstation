import 'package:egasstation/global/themes/styles/app_themes.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors.darkMode({
    required this.primaryColor,
    required this.secondaryColor,
    required this.blueColor,
    required this.greenColor,
    required this.orangeColor,
    required this.darkBlueColor,
    required this.blackColor,
    required this.grayColor,
    required this.whiteColor,
    required this.redColor,
    required this.bgCardColor,
    required this.bgCardColorBold,
    required this.lightGrey,
    required this.greenLight,
    required this.indigoColor,
    required this.whiteColorLock,
  });
  AppColors.lightMode({
    required this.primaryColor,
    required this.secondaryColor,
    required this.blueColor,
    required this.greenColor,
    required this.orangeColor,
    required this.darkBlueColor,
    required this.blackColor,
    required this.grayColor,
    required this.whiteColor,
    required this.redColor,
    required this.bgCardColor,
    required this.bgCardColorBold,
    required this.lightGrey,
    required this.greenLight,
    required this.indigoColor,
    required this.whiteColorLock,
  });

  static late AppColors current;

  final Color primaryColor;

  final Color secondaryColor;

  final Color blueColor;

  final Color greenColor;

  final Color orangeColor;

  final Color darkBlueColor;

  final Color blackColor;

  final Color grayColor;

  final Color whiteColor;
  final Color whiteColorLock;

  final Color redColor;
  final Color greenLight;

  final Color bgCardColor;
  final Color bgCardColorBold;
  final Color lightGrey;
  final Color indigoColor;

  static final AppColors defaultAppColor = AppColors.darkMode(
    primaryColor: const Color(
      0xffec8c1d,
    ),
    secondaryColor: const Color(0xFF0A54A8),
    blueColor: const Color(
      0xff34C476,
    ),
    greenColor: const Color(
      0x00ffb7c2,
    ),
    orangeColor: const Color(
      0xffec8c1d,
    ),
    darkBlueColor: const Color(0xff008a8c),
    blackColor: const Color(0xff000000),
    grayColor: const Color(0xffc8c8c8),
    whiteColor: const Color(0xffffffff),
    redColor: const Color(0xffC04451),
    bgCardColor: const Color(0xffF1F2F6),
    bgCardColorBold: const Color(0xff7e8080),
    lightGrey: const Color(0xFFDBDBDD),
    greenLight: const Color(0xFFCDF5CB),
    indigoColor: Colors.indigo,
    whiteColorLock: Color(0xffffffff),
  );

  static final AppColors lightAppColor = AppColors.lightMode(
    primaryColor: const Color(
      0xffec8c1d,
    ),
    secondaryColor: Colors.white,
    blueColor: const Color(
      0xff34C476,
    ),
    greenColor: const Color(
      0x00ffb7c2,
    ),
    orangeColor: const Color(
      0xffec8c1d,
    ),
    darkBlueColor: const Color(0xff008a8c),
    blackColor: Colors.white,
    grayColor: const Color(0xffc8c8c8),
    whiteColor: const Color(0xff000000),
    redColor: const Color(0xffC04451),
    bgCardColor: const Color(0xff000000),
    bgCardColorBold: Colors.black87,
    lightGrey: const Color(0xFFDBDBDD),
    greenLight: const Color(
      0xff34C476,
    ),
    indigoColor: Colors.indigo,
    whiteColorLock: Color(0xffffffff),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }
}
