// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/datasources/local/local_service.dart' as _i5;
import '../data/datasources/remote/api_service.dart' as _i903;
import '../data/repository_impl/auth_repository_impl.dart' as _i970;
import '../domain/repository/auth_repository.dart' as _i306;
import '../global/navigator/navigation/navigation.dart' as _i736;
import '../global/navigator/navigation/navigation_impl.dart' as _i212;
import '../global/navigator/router/router_observer.dart' as _i660;
import '../global/socket/socket_data_center.dart' as _i468;
import '../presentation/bloc/theme_app_cubit.dart' as _i991;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i660.AppRouteObserver>(() => _i660.AppRouteObserver());
  gh.factory<_i991.ThemeCubit>(() => _i991.ThemeCubit());
  gh.lazySingleton<_i903.ApiService>(() => _i903.ApiService());
  gh.lazySingleton<_i468.SocketDataCenter>(() => _i468.SocketDataCenter());
  gh.lazySingleton<_i736.Navigation>(() => _i212.NavigationImpl());
  gh.factory<_i306.AuthRepository>(() => _i970.RepositoryImpl());
  gh.factory<_i5.LocalService>(
      () => _i5.LocalService(gh<_i460.SharedPreferences>()));
  return getIt;
}
