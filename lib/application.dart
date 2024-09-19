import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:egasstation/global/socket/socket_connect.dart';
import 'package:egasstation/global/themes/styles/app_themes.dart';
import 'package:egasstation/global/untils/app_connection_util.dart';
import 'package:egasstation/presentation/bloc/theme_app_cubit.dart';
import 'package:egasstation/presentation/sign_in/bloc/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';
import 'global/app_lifecycles/app_lifecycle_listener.dart';
import 'global/navigator/navigation/navigation.dart';
import 'global/navigator/router/app_router.dart';
import 'global/navigator/router/router_observer.dart';
import 'global/themes/styles/app_colors.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver = RouteObserver<PageRoute<dynamic>>();

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends AppLifeCycleListener<Application> with WidgetsBindingObserver {
  bool hasConnect = false;
  bool firstNetworkChange = true;
  late final AppConnectionUtils connectionUtils;
  List<ConnectivityResult> connectionResult = [];

  @override
  void initState() {
    SocketConnect().connect();
    WidgetsBinding.instance.addObserver(this); // Register lifecycle observer
    _initConnectivity();
    super.initState();

    AppColors.of(context);
  }

  @override
  void dispose() {
    connectionUtils.dispose();
    SocketConnect().disconnect();
    WidgetsBinding.instance.removeObserver(this); // Unregister lifecycle observer
    super.dispose();
  }

  @override
  void onPauseApp() {
    SocketConnect().disconnect();
  }

  @override
  void onResumeApp() {
    SocketConnect().connect();
  }

  _initConnectivity() async {
    List<ConnectivityResult>? result;
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.toString()}');
    }

    if (!mounted) {
      return Future.value(null);
    }
    connectionResult = result ?? [];
    connectionUtils = AppConnectionUtils.instance(
      (connection) {
        if (firstNetworkChange) {
          firstNetworkChange = false;
        } else if (connectionResult != connection.type) {
          if (connectionUtils.isActive) {
            SocketConnect().connect();
          } else {
            SocketConnect().disconnect();
          }

          connectionResult = connection.type;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        ChangeNotifierProvider.value(value: AuthBloc.instance()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp(
            navigatorKey: navigation.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeCubit.state == lightTheme ? ThemeMode.light : ThemeMode.dark,
            navigatorObservers: [getIt.get<AppRouteObserver>()],
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
