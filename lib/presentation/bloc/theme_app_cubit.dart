import 'package:bloc/bloc.dart';
import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:egasstation/global/themes/styles/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// @Injectable()
// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(_initialTheme()) {
//     _setAppColors();
//   }
//
//   static ThemeData _initialTheme() {
//     return AppThemeSetting.currentAppThemeType == AppThemeType.light ? lightTheme : darkTheme;
//   }
//
//   void _setAppColors() {
//     AppColors.current = AppThemeSetting.currentAppThemeType == AppThemeType.light
//         ? AppColors.defaultAppColor
//         : AppColors.lightAppColor;
//   }
//
//   void toggleTheme() {
//     if (AppThemeSetting.currentAppThemeType == AppThemeType.light) {
//       AppThemeSetting.currentAppThemeType = AppThemeType.dark;
//       emit(darkTheme);
//     } else {
//       AppThemeSetting.currentAppThemeType = AppThemeType.light;
//       emit(lightTheme);
//     }
//     _setAppColors();
//   }
//
//   void setTheme(AppThemeType themeType) {
//     AppThemeSetting.currentAppThemeType = themeType;
//     if (themeType == AppThemeType.light) {
//       emit(lightTheme);
//     } else {
//       emit(darkTheme);
//     }
//     _setAppColors();
//   }
// }
@Injectable()
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_initialTheme()) {
    _setAppColors();
  }

  static ThemeData _initialTheme() {
    return AppThemeSetting.currentAppThemeType == AppThemeType.light ? lightTheme : darkTheme;
  }

  void _setAppColors() {
    AppColors.current = AppThemeSetting.currentAppThemeType == AppThemeType.light
        ? AppColors.defaultAppColor
        : AppColors.lightAppColor;
  }

  Future<void> toggleTheme() async {
    if (AppThemeSetting.currentAppThemeType == AppThemeType.light) {
      await AppThemeSetting.saveTheme(AppThemeType.dark);
      emit(darkTheme);
    } else {
      await AppThemeSetting.saveTheme(AppThemeType.light);
      emit(lightTheme);
    }
    _setAppColors();
  }

  Future<void> setTheme(AppThemeType themeType) async {
    await AppThemeSetting.saveTheme(themeType);
    if (themeType == AppThemeType.light) {
      emit(lightTheme);
    } else {
      emit(darkTheme);
    }
    _setAppColors();
  }
}
