import 'package:flutter/cupertino.dart';

import '../../../gen/assets.gen.dart';
import '../../../global/constants/app_constants.dart';
import '../../../global/themes/styles/app_text_styles.dart';

class CustomWidget extends StatelessWidget {
  String? title;
  final Widget widget;

  CustomWidget({super.key, required this.widget, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Assets.icons.icMoon.image(width: 20, height: 20),
          kSpacingWidth8,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? '',
                      style: AppTextStyle.bodyBold14(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
