import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../themes/styles/app_colors.dart';
import '../themes/styles/app_text_styles.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressed;
  final Widget? title;
  final double? leadingWidth;
  final double? bottomHeight;
  final double? elevation;
  final Color? backgroundColor;
  final Color? labelColor;
  final String? label;
  final bool? centerTitle;
  final bool? showBackButton;
  final PreferredSizeWidget? bottom;
  final List<Widget>? action;
  final Widget? leading;

  const GradientAppBar(
      {Key? key,
      this.onPressed,
      this.title,
      this.elevation,
      this.backgroundColor,
      this.action,
      this.centerTitle,
      this.bottom,
      this.showBackButton,
      this.leading,
      this.leadingWidth,
      this.labelColor,
      this.bottomHeight,
      this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth,
      leading: leading ?? (showBackButton ?? false ? const BackButton() : null),
      title: label != null
          ? Text(
              label!,
              style: AppTextStyle.bodySemiBold18(
                color: labelColor ?? AppColors.current.whiteColor,
              ),
            )
          : title,
      actions: [...?action, kSpacingWidth16],
      elevation: elevation,
      centerTitle: centerTitle ?? true,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[AppColors.current.primaryColor, AppColors.current.secondaryColor]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottomHeight ?? 0));
}
