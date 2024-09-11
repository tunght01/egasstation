import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../themes/styles/app_colors.dart';
import '../themes/styles/app_text_styles.dart';

class AppErrorWidget extends StatelessWidget {
  final dynamic error;
  final VoidCallback tryAgain;
  const AppErrorWidget(this.error, {Key? key, required this.tryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kSpacingHeight8,
        Center(
          child: Text(
            '$error',
            style: AppTextStyle.bodyRegular12(),
          ),
        ),
        kSpacingHeight8,
        GestureDetector(
          onTap: tryAgain,
          child: Column(
            children: [
              Icon(Icons.refresh, color: AppColors.current.primaryColor),
              kSpacingHeight8,
              Text(
                'Thử lại',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.current.primaryColor),
              ),
            ],
          ),
        ),
        kSpacingHeight24,
      ],
    );
  }
}
