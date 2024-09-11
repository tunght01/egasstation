import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:egasstation/presentation/home/widget/dialog_widget.dart';
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
      _toggleDrawer(); // Đóng drawer khi nhấp vào mục
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _selectedMenu.isNotEmpty ? _selectedMenu : 'Home',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.indigo),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.primaryDelta! > 0) {
                // Vuốt phải
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
        elevation: 4.0,
        child: Container(
          width: 120,
          color: AppColors.current.bgCardColor,
          child: Column(
            children: [
              Expanded(
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
            borderRadius: BorderRadius.circular(8.0),
          ),
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
                        ? AppColors.current.secondaryColor
                        : AppColors.current.blackColor,
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
                        ? AppColors.current.secondaryColor
                        : AppColors.current.blackColor,
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
    return Stack(
      children: [
        ListView.separated(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          itemBuilder: (_, index) => const InforWidget(),
          separatorBuilder: (_, __) => const Divider(height: 8),
          itemCount: 10,
        ),
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 2 - 150,
          child: GestureDetector(
            onTap: _toggleDrawer,
            child: Container(
              width: 8,
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
                  color: Colors.grey,
                  size: 8,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class InforWidget extends StatelessWidget {
  const InforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 0.5),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thời gian',
                style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              Text(
                'Số lít',
                style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              Text(
                'Số tiền',
                style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              Text(
                'Trạng thái',
                style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
