import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'application.dart';
import 'di/di.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies(environment: Environment.dev);
    await Future.delayed(
      const Duration(seconds: 1),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
      runApp(
        const Application(),
      );
    });

    ///[console] flavor running hidden when release mode
  }, (error, stackTrace) {});
}
