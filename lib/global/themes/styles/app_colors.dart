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

  final Color redColor;

  final Color bgCardColor;
  final Color bgCardColorBold;
  final Color lightGrey;

  static final AppColors defaultAppColor = AppColors.darkMode(
    primaryColor: const Color(
      0xffec8c1d,
    ),
    secondaryColor: const Color(0xFF3F51B5),
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
    lightGrey: const Color(0xFFD3D3D3),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }
}
