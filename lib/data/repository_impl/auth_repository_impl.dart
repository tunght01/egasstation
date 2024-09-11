import 'package:injectable/injectable.dart';

import '../../di/di.dart';
import '../../domain/entities/user_data_model.dart';
import '../../domain/repository/auth_repository.dart';
import '../../global/network/response/base_respone.dart';
import '../datasources/remote/api_service.dart';

@Injectable(as: AuthRepository)
class RepositoryImpl implements AuthRepository {
  final ApiService _api = getIt.get();

  @override
  Future<BaseResponse<UserDataModel?>> login({required String username, required String password}) {
    return _api.login(username: username, password: password);
  }
}
