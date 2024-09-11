import 'package:flutter/material.dart';

import '../../../global/design_system/card_widget.dart';
import '../../../global/themes/styles/app_colors.dart';

class CardWidgetIcon extends StatelessWidget {
  CardWidgetIcon(
      {this.color, this.icon, required this.title, this.fontSize, this.onTap, this.content});

  final Color? color;
  final IconData? icon;
  final String title;
  final String? content;
  final double? fontSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardWidget(
        border: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Ink(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: color ?? AppColors.current.blackColor,
                ),
              Text(
                title,
                style: TextStyle(
                    color: color ?? AppColors.current.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 13),
              ),
              if (content != null)
                Text(
                  content ?? '',
                  style: TextStyle(
                      color: color ?? AppColors.current.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize ?? 13),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
