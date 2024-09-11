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
        return Icons.home;
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
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int selectedPositionPage = 0;
  final pageController = PageController();
  final _pages = [
    HomePage(),
    const SettingPage(),
  ];

  bool isHadNewMessage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
