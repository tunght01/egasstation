import 'package:flutter/cupertino.dart';

import '../../../di/di.dart';

Navigation navigation = getIt.get<Navigation>();

abstract class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic arguments});

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments});

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments});

  void popUntil(String routeName, {dynamic arguments});

  void pop<T extends Object?>([T? result]);
}
