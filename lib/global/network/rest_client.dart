import 'dart:io';

import 'package:dio/dio.dart';

import '../untils/app_log_untils.dart';

class RestClient {
  late Dio dio;
  RestClient();

  handlerError(dynamic error) {
    dlog('Error:\n$error \n==========\nStackTrace:\n${error.stackTrace}');
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return 'Kết nối mạng không ổn định, vui lòng thử lại';
        default:
          return error.error is SocketException
              ? 'Vui lòng kiểm tra kết nối mạng'
              : 'Đã có lỗi xảy ra, vui lòng thử lại';
      }
    } else {
      return 'Đã có lỗi xảy ra, vui lòng thử lại';
    }
  }
}
