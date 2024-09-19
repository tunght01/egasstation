import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: AppColors.current.lightGrey);
  }
}
