import 'package:egasstation/global/constants/app_constants.dart';
import 'package:egasstation/presentation/setting/setting_page.dart';
import 'package:flutter/material.dart';

import '../../global/themes/styles/app_colors.dart';
import '../../global/themes/styles/app_text_styles.dart';
import '../home/home_page.dart';

enum Page { home, settings }

extension PageEtxs on Page {
  IconData get icon {
    switch (this) {
      case Page.home:
        return Icons.local_gas_station;
      case Page.settings:
        return Icons.settings;
    }
  }

  String get title {
    switch (this) {
      case Page.home:
        return 'Xăng dầu';
      case Page.settings:
        return 'Cài đặt';
    }
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  int selectedPositionPage = 0;
  final pageController = PageController();
  final _pages = [
    HomePage(),
    const SettingPage(),
  ];

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.current.indigoColor,
          body: Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Copyright ',
                      style: AppTextStyle.bodyMedium14(color: AppColors.current.whiteColorLock),
                    ),
                    Icon(
                      Icons.copyright_outlined,
                      color: AppColors.current.whiteColor,
                      size: 14,
                    ),
                    Text(
                      '2024 by PIACOM',
                      style: AppTextStyle.bodyMedium14(color: AppColors.current.whiteColorLock),
                    ),
                  ],
                ),
              ),
              kSpacingHeight8,
            ],
          ),
        ),
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            final scale = _scaleAnimation.value;
            final screenWidth = MediaQuery.of(context).size.width;
            final widgetWidth = screenWidth * scale;

            final offset = (screenWidth - widgetWidth) / 10;

            return Transform(
              transform: Matrix4.identity()
                ..scale(scale)
                ..translate(offset, 0.0),
              alignment: Alignment.centerLeft,
              child: Scaffold(
                body: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pages,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: selectedPositionPage,
                  selectedItemColor: AppColors.current.primaryColor,
                  selectedLabelStyle: AppTextStyle.bodySemiBold12(
                    color: AppColors.current.primaryColor,
                  ),
                  unselectedLabelStyle: AppTextStyle.bodySemiBold12(
                    color: AppColors.current.grayColor,
                  ),
                  unselectedItemColor: AppColors.current.grayColor,
                  onTap: (index) {
                    setState(() {
                      selectedPositionPage = index;
                      pageController.jumpToPage(selectedPositionPage);
                    });
                  },
                  elevation: 10,
                  items: List.generate(
                    Page.values.length,
                    (index) => BottomNavigationBarItem(
                      label: Page.values[index].title,
                      icon: Icon(Page.values[index].icon),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              color: AppColors.current.blackColor,
            ),
            onPressed: _toggleAnimation,
          ),
        ),
      ],
    );
  }
}
