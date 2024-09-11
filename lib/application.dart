import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:egasstation/presentation/setting/theme_provider.dart';
import 'package:egasstation/presentation/sign_in/bloc/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';
import 'global/navigator/navigation/navigation.dart';
import 'global/navigator/router/app_router.dart';
import 'global/navigator/router/router_observer.dart';
import 'global/themes/styles/app_colors.dart';
import 'global/themes/styles/app_themes.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver = RouteObserver<PageRoute<dynamic>>();

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> with WidgetsBindingObserver {
  bool hasConnect = false;
  bool firstNetworkChange = true;
  List<ConnectivityResult> connectionResult = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Register lifecycle observer
    // Initialize colors or other app-wide settings
    AppColors.of(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Unregister lifecycle observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Handle app lifecycle changes if necessary
    switch (state) {
      case AppLifecycleState.paused:
        onPauseApp();
        break;
      case AppLifecycleState.resumed:
        onResumeApp();
        break;
      default:
        break;
    }
  }

  void onPauseApp() {
    // Handle actions when the app is paused
  }

  void onResumeApp() {
    // Handle actions when the app is resumed
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
        ChangeNotifierProvider.value(value: AuthBloc.instance()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeObject, _) {
          return MaterialApp(
            navigatorKey: navigation.navigatorKey,
            debugShowCheckedModeBanner: false,
            themeMode: themeObject.mode,
            theme: lightTheme,
            darkTheme: darkTheme,
            navigatorObservers: [getIt.get<AppRouteObserver>()],
            // Ensure AppRouteObserver is registered
            initialRoute: AppRouter.splash,
            onGenerateRoute: (settings) => AppRouter().generateRoute(settings: settings),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }
}
