import '../../global/network/response/base_respone.dart';
import '../entities/user_data_model.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserDataModel?>> login({required String username, required String password});
}
