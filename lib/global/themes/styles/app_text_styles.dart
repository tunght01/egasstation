import 'package:flutter/material.dart';

import '../dimens/demens.dart';
import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

  static TextStyle bodyCustom({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
    double fontSize = 10,
    double? height,
    FontWeight? fontWeight,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontFamily: 'BeVietNamPro',
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: height,
      ));

  static TextStyle bodyBold52({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d52,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 76 / 52,
      ));

  static TextStyle bodySemiBold52({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d52,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 76 / 52,
      ));

  static TextStyle bodyMedium52({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d52,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 76 / 52,
      ));

  static TextStyle bodyBold36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d36,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 52 / 36,
      ));

  static TextStyle bodySemiBold36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d36,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 52 / 36,
      ));

  static TextStyle bodyMedium36({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d36,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 52 / 36,
      ));

  static TextStyle bodyBold32({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d32,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 20 / 32,
      ));

  static TextStyle bodySemiBold32({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d32,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 20 / 32,
      ));

  static TextStyle bodyMedium32({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d32,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 20 / 32,
      ));

  static TextStyle bodyRegular32({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d32,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 20 / 32,
      ));

  static TextStyle bodyBold28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d28,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 28,
      ));

  static TextStyle bodySemiBold28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d28,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 28,
      ));

  static TextStyle bodyMedium28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d28,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 28,
      ));

  static TextStyle bodyRegular28({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d28,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 28,
      ));

  static TextStyle bodyBold24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d24,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 24,
      ));

  static TextStyle bodySemiBold24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d24,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 24,
      ));

  static TextStyle bodyMedium24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d24,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 24,
      ));

  static TextStyle bodyRegular24({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d24,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 24,
      ));

  static TextStyle bodyBold20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d20,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 20,
      ));

  static TextStyle bodySemiBold20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d20,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 20,
      ));

  static TextStyle bodyMedium20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d20,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 20,
      ));

  static TextStyle bodyRegular20({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d20,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 20,
      ));

  static TextStyle bodyBold18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 18,
      ));

  static TextStyle bodySemiBold18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 18,
      ));

  static TextStyle bodyMedium18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 18,
      ));

  static TextStyle bodyRegular18({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 18,
      ));

  static TextStyle bodyBold16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 1,
      ));

  static TextStyle bodySemiBold16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 1,
      ));

  static TextStyle bodyMedium16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 1,
      ));

  static TextStyle bodyRegular16({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 1,
      ));

  static TextStyle bodyBold14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 14,
      ));

  static TextStyle bodySemiBold14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 14,
      ));

  static TextStyle bodyMedium14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 14,
      ));

  static TextStyle bodyRegular14({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 14,
      ));

  static TextStyle bodyBold12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 12,
      ));

  static TextStyle bodySemiBold12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 12,
      ));

  static TextStyle bodyMedium12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 12,
      ));

  static TextStyle bodyRegular12({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 12,
      ));

  static TextStyle bodyBold10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10,
        fontWeight: FontWeight.w700,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 10,
      ));

  static TextStyle bodySemiBold10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10,
        fontWeight: FontWeight.w600,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 10,
      ));

  static TextStyle bodyMedium10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10,
        fontWeight: FontWeight.w500,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 10,
      ));

  static TextStyle bodyRegular10({
    double? tablet,
    double? ultraTablet,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10,
        fontWeight: FontWeight.w400,
        fontFamily: 'BeVietNamPro',
        fontStyle: fontStyle,
        color: color ?? AppColors.current.blackColor,
        height: 16 / 10,
      ));
}
