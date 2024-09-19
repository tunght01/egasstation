import 'package:egasstation/global/design_system/app_divider.dart';
import 'package:egasstation/global/design_system/card_widget.dart';
import 'package:egasstation/presentation/home/widget/cart_widget_icon.dart';
import 'package:egasstation/presentation/home/widget/dialog_payment_money.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../global/constants/app_constants.dart';
import '../../../global/themes/styles/app_colors.dart';
import '../../../global/themes/styles/app_text_styles.dart';
import 'infor_widget.dart';

void openBottomSheet(BuildContext context) {
  late final TextEditingController _textController = TextEditingController();

  showModalBottomSheet(
    context: context,
    // isScrollControlled: true,
    // enableDrag: false,
    scrollControlDisabledMaxHeightRatio: 0.9,
    backgroundColor: AppColors.current.whiteColor,
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
                icon: Icon(
                  Icons.close,
                  color: AppColors.current.whiteColor,
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
                icon: Icon(
                  Icons.close,
                  color: AppColors.current.blackColor,
                ),
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
                        color: AppColors.current.grayColor,
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
                        color: AppColors.current.lightGrey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CardWidget(
                      padding: EdgeInsets.zero,
                      color: AppColors.current.whiteColor,
                      child: Column(
                        children: [
                          CardWidgetIcon(
                            title: 'Log bơm #3264745673647643',
                            color: AppColors.current.secondaryColor,
                          ),
                          const AppDivider(),
                          Column(
                            children: [
                              InfoWidget(
                                widget: Assets.icons.icTimer.svg(
                                    width: 20, height: 18, color: AppColors.current.secondaryColor),
                                title: 'Thời gian bơm:',
                                content: '08/09/2024 10:21:02',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const AppDivider(),
                              InfoWidget(
                                widget: Assets.icons.icFuel.svg(
                                    width: 20, height: 18, color: AppColors.current.secondaryColor),
                                title: 'Số lít:',
                                content: '8.50',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const Divider(
                                height: 1,
                                color: Color(0xFFDBDBDD),
                              ),
                              InfoWidget(
                                widget: Assets.icons.icMoney.svg(
                                    width: 20, height: 18, color: AppColors.current.secondaryColor),
                                title: 'Số tiền:',
                                content: '177,480',
                                titleStyle: AppTextStyle.bodyRegular12(),
                              ),
                              const Divider(
                                height: 1,
                                color: Color(0xFFDBDBDD),
                              ),
                              InfoWidget(
                                widget: Assets.icons.icBank.svg(
                                    width: 20, height: 18, color: AppColors.current.secondaryColor),
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
                        style: AppTextStyle.bodyRegular12()
                            .copyWith(color: AppColors.current.whiteColorLock),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      openDialogPayment(context, _textController);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.current.indigoColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      minimumSize: const Size(double.infinity, 20),
                      padding: EdgeInsets.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Xác nhận thu tiền mặt',
                        style: AppTextStyle.bodyRegular12()
                            .copyWith(color: AppColors.current.whiteColorLock),
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
