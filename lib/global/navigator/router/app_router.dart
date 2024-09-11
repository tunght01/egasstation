import 'package:egasstation/global/navigator/router/router_module.dart';
import 'package:egasstation/presentation/main/main_page.dart';
import 'package:egasstation/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../presentation/sign_in/sign_in_page.dart';

class AppRouter extends RouterModule {
  AppRouter();
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String main = '/main';

  Route<dynamic>? generateRoute({
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    routesMap.addAll(getRoutes(settings));
    return routesMap[settings.name];
  }

  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      AppRouter.splash:
          MaterialPageRoute(builder: (context) => const SplashPage(), settings: settings),
      AppRouter.signIn:
          MaterialPageRoute(builder: (context) => const SignInPage(), settings: settings),
      AppRouter.main: MaterialPageRoute(builder: (context) => const MainPage(), settings: settings),
    };
  }
}
