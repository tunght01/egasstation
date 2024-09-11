import 'package:egasstation/global/design_system/app_text_form_field.dart';
import 'package:egasstation/global/design_system/card_widget.dart';
import 'package:egasstation/global/navigator/navigation/navigation.dart';
import 'package:egasstation/presentation/home/widget/cart_widget_icon.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../gen/assets.gen.dart';
import '../../../global/constants/app_constants.dart';
import '../../../global/themes/styles/app_colors.dart';
import '../../../global/themes/styles/app_text_styles.dart';
import '../../../global/untils/show_alert.dart';
import 'infor_widget.dart';

void openBottomSheet(BuildContext context) {
  late final TextEditingController _textController = TextEditingController();

  showModalBottomSheet(
    context: context,

    // isScrollControlled: true,
    enableDrag: false,
    scrollControlDisabledMaxHeightRatio: 0.9,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.05, top: 5.0, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Chi tiết log bơm',
                    style:
                        AppTextStyle.bodyBold18().copyWith(color: AppColors.current.secondaryColor),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kSpacingHeight8,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFDBDBDD),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mở app ngân hàng và quét mã QR',
                            style: AppTextStyle.bodyBold14()
                                .copyWith(color: AppColors.current.secondaryColor),
                          ),
                          Assets.images.imgQr.image(width: 160, height: 160),
                        ],
                      ),
                    ),
                  ),
                  kSpacingHeight8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFDBDBDD),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CardWidget(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CardWidgetIcon(
                            title: 'Log bơm #3264745673647643',
                            color: AppColors.current.secondaryColor,
                          ),
                          const Divider(
                            height: 1,
                            color: Color(0xFFDBDBDD),
                          ),
                          Column(
                            children: [
                              InfoWidget(
                                widget: Assets.icons.icTimer
                                    .svg(width: 20, height: 18, color: Colors.indigo),
                                title: 'Thời gian bơm:',
                                content: '08/09/2024 10:21:02',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const Divider(
                                height: 1,
                                color: Color(0xFFDBDBDD),
                              ),
                              InfoWidget(
                                widget: Assets.icons.icFuel
                                    .svg(width: 20, height: 18, color: Colors.indigo),
                                title: 'Số lít:',
                                content: '8.50',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const Divider(
                                height: 1,
                                color: Color(0xFFDBDBDD),
                              ),
                              InfoWidget(
                                widget: Assets.icons.icMoney
                                    .svg(width: 20, height: 18, color: Colors.indigo),
                                title: 'Số tiền:',
                                content: '177,480',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const Divider(
                                height: 1,
                                color: Color(0xFFDBDBDD),
                              ),
                              InfoWidget(
                                widget: Assets.icons.icBank
                                    .svg(width: 20, height: 18, color: Colors.indigo),
                                title: 'NDCK:',
                                content: '1024543598',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.blueColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      minimumSize:
                          const Size(double.infinity, 20), // Đặt chiều cao ngắn lại (ví dụ 36)
                      padding: EdgeInsets.zero, // Loại bỏ padding mặc định
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0), // Cân chỉnh padding lại
                      child: Text(
                        'Kiểm tra trạng thái CK',
                        style: AppTextStyle.bodyRegular12().copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
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
                                        style: AppTextStyle.bodyBold14()
                                            .copyWith(color: AppColors.current.orangeColor),
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
                              controller: _textController,
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
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                kSpacingWidth8,
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.current.secondaryColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                    ),
                                    child: Text(
                                      'Xác nhận',
                                      style: AppTextStyle.bodyRegular12()
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.secondaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      minimumSize:
                          const Size(double.infinity, 20), // Đặt chiều cao ngắn lại (ví dụ 36)
                      padding: EdgeInsets.zero, // Loại bỏ padding mặc định
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0), // Cân chỉnh padding lại
                      child: Text(
                        'Xác nhận thu tiền mặt',
                        style: AppTextStyle.bodyRegular12().copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
