import 'package:flutter/material.dart';

import '../dimens/demens.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ?? AppColors.defaultAppColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static AppThemeType currentAppThemeType = AppThemeType.light;
}

/// define custom themes here
final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  colorScheme: _lightColorScheme,
  inputDecorationTheme: lightInputDecorationTheme,
  textTheme: lightTextTheme,
  elevatedButtonTheme: lightElevatedButtonThemeData,
  bottomNavigationBarTheme: _lightBottomNavigationBarTheme,
  appBarTheme: _lightAppBarTheme,
)..addAppColor(
    AppThemeType.light,
    AppColors.defaultAppColor,
  );

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  colorScheme: _darkColorScheme,
  inputDecorationTheme: darkInputDecorationTheme,
  textTheme: darkTextTheme,
  elevatedButtonTheme: darkElevatedButtonThemeData,
  bottomNavigationBarTheme: _darkBottomNavigationBarTheme,
  appBarTheme: _darkAppBarTheme,
)..addAppColor(
    AppThemeType.dark,
    AppColors.defaultAppColor,
  );

ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.defaultAppColor.primaryColor,
  onPrimary: Color(0xFF282828),
  secondary: AppColors.defaultAppColor.secondaryColor,
  onSecondary: Colors.white,
  onError: Colors.white,
  background: Colors.white,
  onBackground: AppColors.defaultAppColor.whiteColor,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
);
ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.defaultAppColor.primaryColor,
  onPrimary: Color(0xFF282828),
  secondary: AppColors.defaultAppColor.secondaryColor,
  onSecondary: Colors.white,
  onError: Colors.white,
  background: AppColors.defaultAppColor.whiteColor,
  onBackground: AppColors.defaultAppColor.whiteColor,
  surface: Colors.black,
  onSurface: Colors.white,
  error: Colors.red,
);

///================ BAR DECORATION ===================
/// Light Bottom Navigation Bar Theme
const BottomNavigationBarThemeData _lightBottomNavigationBarTheme = BottomNavigationBarThemeData();

/// Dark Bottom Navigation Bar Theme
BottomNavigationBarThemeData _darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
  backgroundColor: AppColors.defaultAppColor.whiteColor,
  type: BottomNavigationBarType.fixed,
  elevation: 0.0,
  // selectedItemColor: AppColors.primary_01,
  // selectedLabelStyle: AppTextStyle.bottomNavLabel,
  // unselectedItemColor: AppColors.dark_bottom_navigation_bar_unselected,
  // unselectedLabelStyle: AppTextStyle.bottomNavLabel,
);

/// Light AppBar Theme
AppBarTheme _lightAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.defaultAppColor.primaryColor,
  elevation: 0.0,
  centerTitle: true,
  titleTextStyle: AppTextStyle.bodySemiBold20(
    color: AppColors.defaultAppColor.whiteColor,
  ),
);

/// Dark AppBar Theme
AppBarTheme _darkAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.defaultAppColor.primaryColor,
  elevation: 0.0,
  centerTitle: true,
  titleTextStyle: AppTextStyle.bodySemiBold20(
    color: AppColors.defaultAppColor.whiteColor,
  ),
);

///================ INPUT DECORATION ===================

const InputBorder _defaulBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(1000),
  ),
);

final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  filled: true,
  isDense: true,
  fillColor: AppColors.defaultAppColor.whiteColor,
  focusColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(
    horizontal: Dimens.spacingLg,
    vertical: Dimens.spacingSm,
  ),
  floatingLabelAlignment: FloatingLabelAlignment.start,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  // floatingLabelStyle:
  //     AppTextStyle.labelMedium_12.copyWith(color: AppColors.neutral_01),
  hintStyle: AppTextStyle.bodyRegular12(),
  border: _defaulBorder,
  enabledBorder: _defaulBorder,
  disabledBorder: _defaulBorder,
  focusedBorder: _defaulBorder.copyWith(
    borderSide: BorderSide(color: AppColors.defaultAppColor.grayColor, width: 1),
  ),
);

final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  isDense: true,
  fillColor: AppColors.defaultAppColor.whiteColor,
  focusColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(
    horizontal: Dimens.spacingLg,
    vertical: Dimens.spacingSm,
  ),

  // floatingLabelStyle:
  //     AppTextStyle.labelMedium_12.copyWith(color: AppColors.neutral_01),
  hintStyle: AppTextStyle.bodyRegular12(),
  border: _defaulBorder,
  enabledBorder: _defaulBorder,
  disabledBorder: _defaulBorder,
  focusedBorder: _defaulBorder.copyWith(
    borderSide: BorderSide(color: AppColors.defaultAppColor.grayColor, width: 1),
  ),
);

const TextTheme lightTextTheme = TextTheme(
  bodyLarge: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
);
const TextTheme darkTextTheme = TextTheme(
  bodyLarge: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
);

///================ BUTTON DECORATION ===================
final ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
    // style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
    //     (Set<MaterialState> states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return AppColors.neutral_03;
    //       }
    //       return AppColors.primary_01;
    //     },
    //   ),
    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //     RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //   ),
    // ),
    );
final ElevatedButtonThemeData darkElevatedButtonThemeData = ElevatedButtonThemeData(
    // style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
    //     (Set<MaterialState> states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return AppColors.neutral_03;
    //       }
    //       return AppColors.primary_01;
    //     },
    //   ),
    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //     RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //   ),
    // ),
    );
