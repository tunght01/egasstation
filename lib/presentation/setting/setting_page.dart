import 'package:egasstation/global/constants/app_constants.dart';
import 'package:egasstation/global/design_system/app_divider.dart';
import 'package:egasstation/global/design_system/card_widget.dart';
import 'package:egasstation/global/design_system/gradient_appbar.dart';
import 'package:egasstation/presentation/setting/widget/divider_custom.dart';
import 'package:egasstation/presentation/sign_in/bloc/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/local/local_service.dart';
import '../../di/di.dart';
import '../../gen/assets.gen.dart';
import '../../global/navigator/navigation/navigation.dart';
import '../../global/navigator/router/app_router.dart';
import '../../global/themes/styles/app_colors.dart';
import '../../global/themes/styles/app_text_styles.dart';
import '../bloc/theme_app_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late AuthBloc _bloc;
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;

  @override
  void initState() {
    _bloc = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    isOn = _darkModeEnabled ? 1 : 0;

    return Scaffold(
      appBar: GradientAppBar(
        label: "Cài đặt",
        backgroundColor: AppColors.current.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildUserInfo(_bloc.userName),
              const AppDivider(),
              _buildDarkModeToggle(context),
              const DividerCustom(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    openBottomSheetSetting(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.icons.icGasStationLine
                          .image(width: 20, height: 20, color: AppColors.current.secondaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cấu hình vòi bơm', style: AppTextStyle.bodyBold14()),
                            Icon(Icons.arrow_forward_ios, color: AppColors.current.secondaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const DividerCustom(),
              _buildVersionInfo(),
              const DividerCustom(),
              _buildLogoutButton(),
              const DividerCustom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(String username) {
    return Column(
      children: [
        Assets.images.imgUser.image(width: 100, color: AppColors.current.secondaryColor),
        const SizedBox(height: 8),
        Text(username,
            style: AppTextStyle.bodyBold16().copyWith(color: AppColors.current.blackColor)),
        const SizedBox(height: 4),
        Text(username, style: AppTextStyle.bodyRegular16()),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDarkModeToggle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Assets.icons.icMoon.image(width: 20, height: 20, color: AppColors.current.secondaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chế độ tối', style: AppTextStyle.bodyBold14()),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();

                    context.read<ThemeCubit>().toggleTheme();

                    setState(() {
                      isOn = isOn == 0 ? 1 : 0;
                    });
                  },
                  child: _buildToggleSwitch(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch() {
    // Đặt kích thước cố định cho nút chuyển đổi
    const double toggleWidth = 60.0; // Chiều rộng cố định
    const double toggleHeight = 30.0; // Chiều cao cố định
    const double circleSize = 24.0; // Kích thước của hình tròn bên trong

    return AnimatedContainer(
      duration: const Duration(milliseconds: 360),
      width: toggleWidth,
      height: toggleHeight,
      decoration: BoxDecoration(
        color: isOn == 0 ? AppColors.current.lightGrey : Colors.orange,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 360),
            top: 0,
            left: isOn == 0 ? 0 : toggleWidth - toggleHeight,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          // AnimatedPositioned cho dấu hiệu nhỏ
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 360),
          //   top: isOn == 0 ? (toggleHeight - 12) / 2 : 6,
          //   left: isOn == 0 ? 6 : toggleWidth - toggleHeight,
          //   child: AnimatedContainer(
          //     duration: const Duration(milliseconds: 360),
          //     width: isOn == 0 ? 6 : toggleHeight - 18,
          //     height: isOn == 0 ? 6 : toggleHeight - 18,
          //     decoration: BoxDecoration(
          //       color: isOn == 0 ? AppColors.current.lightGrey : Colors.orange,
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Assets.icons.icOcticonVersions16
              .image(width: 20, height: 20, color: AppColors.current.secondaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phiên bản', style: AppTextStyle.bodyBold14()),
                Text('0.0.1', style: TextStyle(color: AppColors.current.secondaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        getIt.get<LocalService>().clear();
        navigation.pushNamedAndRemoveUntil(AppRouter.signIn);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Assets.icons.icLogout.image(width: 20, height: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Đăng xuất', style: AppTextStyle.bodyBold14()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openBottomSheetSetting(BuildContext context) {
  List<String> listNameGas = [
    'DO 0.05S',
    'Xăng RON95-III',
    'Xăng E5 RON 92',
    'Xăng E5 RON 92',
    'Xăng RON95-III',
    'DO 0.005S'
  ];
  showModalBottomSheet(
    context: context,
    scrollControlDisabledMaxHeightRatio: 0.9,
    enableDrag: false,
    backgroundColor: AppColors.current.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0), // Tùy chỉnh bo tròn góc trên
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.current.whiteColor,
                ),
                onPressed: null,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Cấu hình vòi bơm',
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
          kSpacingHeight8,
          // Header for card section
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Tên vòi',
                    style:
                        AppTextStyle.bodyBold18().copyWith(color: AppColors.current.secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Tên mặt hàng',
                    style:
                        AppTextStyle.bodyBold18().copyWith(color: AppColors.current.secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Checkbox(
                  value: true,
                  checkColor: AppColors.current.whiteColor,
                  activeColor: AppColors.current.secondaryColor,
                  onChanged: (value) {},
                ),
                kSpacingWidth6,
              ],
            ),
          ),
          kSpacingHeight8,
          // List of cards with scroll capability
          Expanded(
            child: ListView.builder(
              itemCount: listNameGas.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CardVoiBom(
                  pumpHoseNumber: 'Vòi ${index + 1}',
                  nameGas: listNameGas[index],
                ),
              ),
            ),
          ),
          // Bottom button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.current.indigoColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                minimumSize: const Size(double.infinity, 20),
                padding: EdgeInsets.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Text(
                  'Xác nhận',
                  style:
                      AppTextStyle.bodyBold16().copyWith(color: AppColors.current.whiteColorLock),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class CardVoiBom extends StatelessWidget {
  const CardVoiBom({super.key, required this.pumpHoseNumber, required this.nameGas});
  final String pumpHoseNumber;
  final String nameGas;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      color: AppColors.current.greenLight,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.icGasStationLine.image(color: AppColors.current.secondaryColor),
            kSpacingWidth8,
            Expanded(
              flex: 3,
              child: Text(
                pumpHoseNumber,
                style: AppTextStyle.bodyMedium14(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kSpacingWidth8,
            Expanded(
              flex: 4,
              child: Text(
                nameGas,
                style: AppTextStyle.bodyMedium14(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kSpacingWidth8,
            Checkbox(
              value: true,
              checkColor: AppColors.current.whiteColor,
              activeColor: AppColors.current.secondaryColor,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
