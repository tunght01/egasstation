import 'dart:io';

import 'package:dio/dio.dart';

import '../../../presentation/sign_in/bloc/auth_cubit.dart';

class SessionInterceptor implements InterceptorsWrapper {
  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      return;
    }
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AuthBloc.instance().isLogged) {
      options.headers
          .addAll(<String, dynamic>{'Authorization': 'Bearer ${AuthBloc.instance().accessToken}'});
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
