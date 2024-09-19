import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Divider(
            height: 1,
            color: Colors.transparent,
          ),
        ),
        Expanded(
          flex: 8,
          child: Divider(
            height: 1,
            color: AppColors.current.lightGrey,
          ),
        ),
      ],
    );
  }
}
