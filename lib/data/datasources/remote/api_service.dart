import 'package:injectable/injectable.dart';

import '../../../domain/entities/user_data_model.dart';
import '../../../global/network/networking_factory.dart';
import '../../../global/network/response/base_respone.dart';
import '../../../global/network/rest_client.dart';
import '../../dto/user_data_dto.dart';

@lazySingleton
class ApiService extends RestClient {
  ApiService();

  void setDio(String url) {
    dio = NetworkingFactory.createDio(baseUrl: url);
  }

  String loginPath = '/api/TBCT/Identity/Auth/SignIn';

  Future<BaseResponse<UserDataModel?>> login(
      {required String username, required String password}) async {
    try {
      Map<String, dynamic> data = {
        "deviceId": "24E8A690-E4C5-4459-8D43-06A8C7FCEE64",
        "deviceModel": "iPhone 15",
        "deviceToken": "",
        "password": password,
        "userAgent": "iOS",
        "username": username
      };
      final response = await dio.post(loginPath, data: data);
      return BaseResponse.fromJson(
          response.data, (json) => UserDataDto.fromJson(json as Map<String, dynamic>));
    } catch (err) {
      throw handlerError(err);
    }
  }
}
