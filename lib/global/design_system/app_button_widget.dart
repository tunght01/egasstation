import 'package:flutter/material.dart';

import '../themes/styles/app_colors.dart';

class AppButtonWidget extends ElevatedButton {
  AppButtonWidget(
      {super.key,
      String? title,
      Widget? child,
      BorderRadiusGeometry? borderRadius,
      Color? color,
      double? fontSize,
      double? minWidth,
      double? minHeight,
      Color? titleColor,
      EdgeInsets? padding,
      Color? borderColor,
      super.onPressed})
      : super(
            child: child ??
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: onPressed != null
                          ? titleColor ?? borderColor ?? AppColors.current.whiteColor
                          : AppColors.current.grayColor,
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Archivo'),
                ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith<Size>((state) {
                return Size(minWidth ?? double.infinity, minHeight ?? 48);
              }),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (states) {
                  return RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(8),
                    side: BorderSide(
                        color: onPressed != null
                            ? borderColor ?? color ?? AppColors.current.primaryColor
                            : AppColors.current.grayColor),
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.current.grayColor; // Disabled color
                }
                return color ?? AppColors.current.primaryColor; // Regular color
              }),
            ));
}
