import 'package:egasstation/global/constants/app_constants.dart';
import 'package:egasstation/global/design_system/app_text_form_field.dart';
import 'package:egasstation/global/navigator/navigation/navigation.dart';
import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:egasstation/global/untils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void openDialogPayment(BuildContext context, TextEditingController textController) {
  ShowAlert.showDialog(
    title: 'Thanh toán tiền mặt',
    alertType: AlertType.none,
    content: Column(
      children: [
        kSpacingHeight8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Nhập ',
                    style: AppTextStyle.bodyBold14(),
                  ),
                  TextSpan(
                    text: 'TM ',
                    style: AppTextStyle.bodyBold14().copyWith(color: AppColors.current.orangeColor),
                  ),
                  TextSpan(
                    text: 'và nhấn xác nhận',
                    style: AppTextStyle.bodyBold14(),
                  ),
                ],
              ),
            ),
          ],
        ),
        kSpacingHeight8,
        AppTextFormField(
          controller: textController,
        ),
        kSpacingHeight8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  navigation.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.current.orangeColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: Text(
                  'Bỏ qua',
                  style: AppTextStyle.bodyRegular12()
                      .copyWith(color: AppColors.current.whiteColorLock),
                ),
              ),
            ),
            kSpacingWidth8,
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.current.indigoColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: Text(
                  'Xác nhận',
                  style: AppTextStyle.bodyRegular12()
                      .copyWith(color: AppColors.current.whiteColorLock),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
