import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/datasources/local/local_service.dart';
import '../../../data/datasources/local/secure_storage.dart';
import '../../../data/datasources/remote/api_service.dart';
import '../../../data/dto/user_data_dto.dart';
import '../../../di/di.dart';
import '../../../domain/entities/user_data_model.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../global/navigator/navigation/navigation.dart';
import '../../../global/navigator/router/app_router.dart';
import '../../../global/untils/show_alert.dart';

class AuthBloc extends ChangeNotifier {
  AuthBloc._internal();

  factory AuthBloc.instance() {
    _instance ??= AuthBloc._internal();
    return _instance!;
  }

  static AuthBloc? _instance;

  final AuthRepository _authRepository = getIt.get<AuthRepository>();

  UserDataModel? _userData;
  String get userName => _userData?.userName ?? '';
  String get signalRUrl => _userData?.signalRUrl ?? '';
  String get accessToken => _userData?.accessToken ?? '';
  bool get isLogged => _userData?.accessToken != null;

  bool rememberMe = true;

  void setRememberMe(bool value) {
    rememberMe = value;
  }

  UserDataModel? getUserData() {
    return _userData;
  }

  Future<void> loginGetUrl({
    required String username,
    required String password,
  }) async {
    try {
      getIt.get<ApiService>().setDio('http://mobile-app-dev.piacom.com.vn');
      await Future.delayed(const Duration(milliseconds: 500));
      await login(username: username, password: password);
      return;
    } catch (err) {
      ShowAlert.showDialog(
          title: 'Đăng nhập thất bại',
          content: Text(
            err.toString(),
            style: AppTextStyle.bodyRegular12(),
            textAlign: TextAlign.center,
          ),
          status: false);
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final auth = await _authRepository.login(username: username, password: password);
      _userData = auth.data;
      if (auth.data != null && auth.data?.accessToken != null) {
        await getIt.get<LocalService>().saveAuth(auth.data as UserDataDto?);
        await getIt.get<LocalService>().saveLogin(rememberMe);
        await getIt.get<LocalService>().saveUsername(username);
        if (rememberMe) {
          await SecureStorage().saveUser(username);
          await SecureStorage().savePassword(password);
        } else {
          await SecureStorage().removeUser();
          await SecureStorage().removePassword();
        }
        navigation.pushNamedAndRemoveUntil(AppRouter.main);
        ShowAlert.showDialog(
            title: 'Đăng nhập thành công',
            content: Text(
              '${auth.message}',
              style: AppTextStyle.bodyRegular12(),
              textAlign: TextAlign.center,
            ),
            status: true);
      } else {
        ShowAlert.showDialog(
            title: 'Đăng nhập thất bại',
            content: Text(
              '${auth.message}',
              style: AppTextStyle.bodyRegular12(),
              textAlign: TextAlign.center,
            ),
            status: false);
      }
      return;
    } catch (err) {
      ShowAlert.showDialog(
          title: 'Đăng nhập thất bại',
          content: Text(
            err.toString(),
            style: AppTextStyle.bodyRegular12(),
            textAlign: TextAlign.center,
          ),
          status: false);
    }
  }

  Future<void> rememberLogin({required String username, required String password}) async {
    try {
      getIt.get<ApiService>().setDio('http://mobile-app-dev.piacom.com.vn');
      await Future.delayed(const Duration(milliseconds: 500));
      final auth = await _authRepository.login(username: username, password: password);
      if (auth.data != null) {
        _userData = auth.data;
        await getIt.get<LocalService>().saveAuth(auth.data as UserDataDto?);
        navigation.pushNamedAndRemoveUntil(AppRouter.main);
      } else {
        navigation.pushNamedAndRemoveUntil(AppRouter.signIn);
      }
    } catch (err) {
      navigation.pushNamedAndRemoveUntil(AppRouter.signIn);
    }
  }
}
