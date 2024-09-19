import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../global/constants/app_constants.dart';
import '../../../global/themes/styles/app_text_styles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    this.content,
    this.contentStyle,
    this.icon,
    this.titleStyle,
    this.widget,
  });

  final String title;
  final String? content;
  final TextStyle? contentStyle;
  final TextStyle? titleStyle;
  final IconData? icon;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(
                  icon ?? Icons.lock_clock,
                  color: Colors.indigo,
                ),
              if (icon != null) kSpacingWidth8,
              if (widget != null) widget!,
              if (widget != null) kSpacingWidth8,
              Text(
                title,
                style: titleStyle ?? AppTextStyle.bodySemiBold12(),
              ),
            ],
          ),
          kSpacingWidth4,
          if (content != null)
            Text(
              content ?? '',
              style: contentStyle ??
                  AppTextStyle.bodyBold12().copyWith(color: AppColors.current.secondaryColor),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
