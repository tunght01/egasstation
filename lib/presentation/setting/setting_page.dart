import 'package:egasstation/global/constants/app_constants.dart';
import 'package:egasstation/global/design_system/card_widget.dart';
import 'package:egasstation/presentation/setting/theme_provider.dart';
import 'package:egasstation/presentation/setting/widget/divider_custom.dart';
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
// Adjust the import based on your project structure

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;

  @override
  Widget build(BuildContext context) {
    bool _darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    isOn = _darkModeEnabled ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cài đặt",
          style: TextStyle(color: Colors.indigo),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildUserInfo(),
              const Divider(height: 1, color: Color(0xFFDBDBDD)),
              _buildDarkModeToggle(),
              const DividerCustom(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    _openBottomSheet(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.icons.icGasStationLine.image(width: 20, height: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cấu hình vòi bơm', style: AppTextStyle.bodyBold14()),
                            const Icon(Icons.arrow_forward_ios, color: Colors.indigo),
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

  Widget _buildUserInfo() {
    return Column(
      children: [
        Assets.images.imgUser.image(width: 100, color: Colors.indigo),
        const SizedBox(height: 8),
        Text('5000080', style: AppTextStyle.bodyBold16()),
        const SizedBox(height: 4),
        Text('5000080', style: AppTextStyle.bodyRegular16()),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDarkModeToggle() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Assets.icons.icMoon.image(width: 20, height: 20, color: Colors.indigo),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chế độ tối', style: AppTextStyle.bodyBold14()),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Provider.of<ThemeProvider>(context, listen: false).toggleMode();
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 360),
      width: s.width / 6,
      height: s.width * 0.08,
      decoration: BoxDecoration(
        color: isOn == 0 ? AppColors.current.lightGrey : Colors.orange,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 360),
            top: 0,
            left: (s.width * 0.08) * isOn,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: s.width * 0.08 - 12,
                height: s.width * 0.08 - 12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 360),
            top: isOn == 0 ? (s.width * 0.08 - 6) / 2 : 6,
            left: (s.width * 0.08 - 6) * isOn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 360),
              width: 6 + (s.width * 0.08 - 18) * isOn,
              height: 6 + (s.width * 0.08 - 18) * isOn,
              decoration: BoxDecoration(
                color: isOn == 0 ? AppColors.current.lightGrey : Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Assets.icons.icOcticonVersions16.image(width: 20, height: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phiên bản', style: AppTextStyle.bodyBold14()),
                const Text('0.0.1', style: TextStyle(color: Colors.indigo)),
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

void _openBottomSheet(BuildContext context) {
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
    backgroundColor: Colors.white,
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
          // Header with title and close button
          Row(
            children: [
              const IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
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
                Icon(Icons.check_box_outline_blank_outlined,
                    color: AppColors.current.secondaryColor),
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
                  minimumSize: const Size(double.infinity, 36),
                  backgroundColor: AppColors.current.secondaryColor),
              child: Text(
                'Xác nhận',
                style: AppTextStyle.bodyRegular12().copyWith(color: Colors.white),
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
      color: const Color(0xFFCDF5CB),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.icGasStationLine.image(),
            kSpacingWidth8,
            Expanded(
              flex: 3,
              child: Text(
                pumpHoseNumber,
                style: AppTextStyle.bodyBold16(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kSpacingWidth8,
            Expanded(
              flex: 4,
              child: Text(
                nameGas,
                style: AppTextStyle.bodyBold16(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kSpacingWidth8,
            Icon(Icons.check_box, color: AppColors.current.secondaryColor),
          ],
        ),
      ),
    );
  }
}
