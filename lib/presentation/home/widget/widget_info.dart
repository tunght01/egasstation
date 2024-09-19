import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class InforWidget extends StatelessWidget {
  const InforWidget(
      {super.key,
      required this.content1,
      required this.content2,
      required this.content3,
      required this.content4,
      this.isBanner = false,
      this.onTap});
  final bool isBanner;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.current.grayColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content1,
                style: !isBanner
                    ? AppTextStyle.bodyRegular12()
                    : TextStyle(
                        color: AppColors.current.secondaryColor, fontWeight: FontWeight.bold),
              ),
              Text(
                content2,
                style: !isBanner
                    ? AppTextStyle.bodyRegular12()
                    : TextStyle(
                        color: AppColors.current.secondaryColor, fontWeight: FontWeight.bold),
              ),
              Text(
                content3,
                style: !isBanner
                    ? AppTextStyle.bodyBold12()
                    : TextStyle(
                        color: AppColors.current.secondaryColor, fontWeight: FontWeight.bold),
              ),
              Text(
                content4,
                style: !isBanner
                    ? AppTextStyle.bodyRegular12()
                    : TextStyle(
                        color: AppColors.current.secondaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
