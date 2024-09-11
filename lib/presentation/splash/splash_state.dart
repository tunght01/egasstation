abstract class SplashState {}

class SplashInit extends SplashState {}

class GetConfigDataSuccess extends SplashState {}

class UpdateVersion extends SplashState {}

class ErrorState extends SplashState {
  final dynamic error;

  ErrorState(this.error);
}
