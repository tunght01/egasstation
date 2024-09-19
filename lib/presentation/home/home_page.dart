import 'package:egasstation/global/design_system/gradient_appbar.dart';
import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:egasstation/presentation/home/widget/dialog_widget.dart';
import 'package:egasstation/presentation/home/widget/widget_info.dart';
import 'package:egasstation/presentation/setting/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _drawerAnimation;
  late Animation<double> _contentAnimation;
  bool _isDrawerOpen = false;
  String _selectedMenu = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    const double drawerWidth = 120;

    _drawerAnimation = Tween<double>(begin: -drawerWidth, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _contentAnimation = Tween<double>(begin: 0, end: drawerWidth).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isDrawerOpen = !_isDrawerOpen;
  }

  void _selectMenu(String title) {
    setState(() {
      _selectedMenu = title;
      _toggleDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        label: 'Home',
      ),
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.primaryDelta! > 0) {
                if (!_isDrawerOpen) {
                  _toggleDrawer();
                }
              } else if (details.primaryDelta! < 0) {
                // Vuốt trái
                if (_isDrawerOpen) {
                  _toggleDrawer();
                }
              }
            },
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_contentAnimation.value, 0),
                  child: _buildBody(),
                );
              },
            ),
          ),
          _buildDrawer(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Positioned(
      left: _drawerAnimation.value,
      top: 0,
      bottom: 0,
      child: Material(
        color: AppColors.current.whiteColor,
        elevation: 4.0,
        child: Container(
          width: 120,
          color: AppColors.current.whiteColor,
          child: Column(
            children: [
              Flexible(
                flex: 9,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _buildDrawerItem('Vòi 1', 'DO 0.05S'),
                    _buildDrawerItem('Vòi 2', 'Xăng RON95-III'),
                    _buildDrawerItem('Vòi 3', 'Xăng ES RON 92'),
                    _buildDrawerItem('Vòi 4', 'Xăng ES RON 95'),
                    _buildDrawerItem('Vòi 5', 'Xăng RON 95 - III'),
                    _buildDrawerItem('Vòi 6', 'DO 0.05S'),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    openBottomSheetSetting(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.current.blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.current.whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, String subtitle) {
    bool isSelected = _selectedMenu == title;
    return InkWell(
      onTap: () => _selectMenu(title),
      child: Container(
        padding: EdgeInsets.only(left: isSelected ? 20.0 : 8.0, right: isSelected ? 0.0 : 8.0),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
          shape: RoundedRectangleBorder(
              borderRadius: isSelected
                  ? BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                  : BorderRadius.circular(8.0)),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bodyBold14().copyWith(
                    color: isSelected
                        ? AppColors.current.orangeColor
                        : AppColors.current.secondaryColor,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyle.bodyBold10().copyWith(
                    color: isSelected
                        ? AppColors.current.orangeColor
                        : AppColors.current.secondaryColor,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: InforWidget(
            content1: 'Thời gian',
            content2: 'Số lít',
            content3: 'Số tiền',
            content4: 'Trạng thái',
            isBanner: true,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                children: <Widget>[
                  InforWidget(
                    content1: '20:26:25',
                    content2: '8.08',
                    content3: '80,172',
                    content4: 'Chưa gán',
                    onTap: () {
                      openBottomSheet(context);
                    },
                  ),
                  SizedBox(height: 8),
                  InforWidget(
                      content1: '21:26:25',
                      content2: '8.08',
                      content3: '80,172',
                      content4: 'Chưa gán',
                      onTap: () {
                        openBottomSheet(context);
                      }),
                  SizedBox(height: 8),
                  InforWidget(
                    content1: '22:26:25',
                    content2: '8.08',
                    content3: '80,172',
                    content4: 'Chưa gán',
                    onTap: () {
                      openBottomSheet(context);
                    },
                  ),
                  SizedBox(height: 8),
                  InforWidget(
                      content1: '23:26:25',
                      content2: '8.08',
                      content3: '80,172',
                      content4: 'Chưa gán',
                      onTap: () {
                        openBottomSheet(context);
                      }),
                  SizedBox(height: 8),
                  InforWidget(
                      content1: '19:26:25',
                      content2: '8.08',
                      content3: '80,172',
                      content4: 'Chưa gán',
                      onTap: () {
                        openBottomSheet(context);
                      }),
                  SizedBox(height: 8),
                  InforWidget(
                      content1: '20:26:25',
                      content2: '8.08',
                      content3: '80,172',
                      content4: 'Chưa gán',
                      onTap: () {
                        openBottomSheet(context);
                      }),
                ],
              ),
              Positioned(
                left: 0,
                top: MediaQuery.of(context).size.height / 2 - 150,
                child: GestureDetector(
                  onTap: _toggleDrawer,
                  child: Container(
                    width: 10,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.current.bgCardColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.current.blackColor,
                        size: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
