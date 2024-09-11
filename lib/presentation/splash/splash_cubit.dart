import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:egasstation/presentation/splash/splash_state.dart';

import '../../data/datasources/local/local_service.dart';
import '../../data/datasources/local/secure_storage.dart';
import '../../di/di.dart';
import '../../domain/repository/auth_repository.dart';
import '../../global/navigator/navigation/navigation.dart';
import '../../global/navigator/router/app_router.dart';
import '../sign_in/bloc/Auth_cubit.dart';

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository _authRepository = getIt.get();
  bool rememberMe = false;
  final int _kAnimationDelayMilli = 2500;

  SplashBloc() : super(SplashInit());

  void refresh() {
    emit(SplashInit());
  }

  void init() async {
    final startTime = DateTime.now().millisecondsSinceEpoch;
    try {
      await _delayEmitEvent(startTime);
      await getConfigData();
      bool isUpdate = await _checkAppVersion();
      if (isUpdate) {
        emit(UpdateVersion());
      }
    } catch (_) {
      emit(ErrorState(e));
    }
  }

  Future getConfigData() async {
    try {
      // if(getIt.get<LocalService>().getCache() != null){
      //   emit(GetConfigDataSuccess());
      // }
      // final BaseResponse<GeneralModel> response = await _authRepository.generalData();
      // if (response.data != null) {
      //     getIt.get<LocalService>().saveCache(response.data!);
      // }
      emit(GetConfigDataSuccess());
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  Future checkSaveLogin() async {
    rememberMe = await getIt.get<LocalService>().getSaveLogin();
    if (rememberMe) {
      String us = await SecureStorage().getUser();
      String pw = await SecureStorage().getPassword();
      if (us.isNotEmpty && pw.isNotEmpty) {
        AuthBloc.instance().rememberLogin(username: us, password: pw);
      } else {
        navigation.pushNamedAndRemoveUntil(AppRouter.signIn);
      }
    } else {
      navigation.pushNamedAndRemoveUntil(AppRouter.signIn);
    }
  }

  Future<void> _delayEmitEvent(int startTime) async {
    final endTime = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(
        Duration(milliseconds: max(0, _kAnimationDelayMilli - (endTime - startTime))));
  }

  Future<bool> _checkAppVersion() async {
    /// todo check version
    return false;
  }
}
