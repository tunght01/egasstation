import 'package:flutter/material.dart';

import '../themes/styles/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.border,
    this.color,
    this.elevation = 3,
    this.shadowColor,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    this.onTap,
  });

  final Widget child;
  final BorderRadiusGeometry? border;
  final Color? color;
  final double elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.current.bgCardColor,
      elevation: elevation,
      shadowColor: shadowColor ?? Colors.black.withOpacity(0.2),
      borderRadius: border ?? BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: border ?? BorderRadius.circular(12),
            color: color ?? AppColors.current.whiteColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
