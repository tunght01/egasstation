import 'package:egasstation/config/app_config.dart';

class UatConfig extends Config {
  @override
  String get baseUrl => throw UnimplementedError();

  @override
  String get marektUrl => throw UnimplementedError();

  @override
  int get socketPort => throw UnimplementedError();

  @override
  String get socketUrl => 'ws://10.59.11.26:8800/BHTDSocket';

  @override
  String get tradingUrl => throw UnimplementedError();

  @override
  String get tradingViewSessionUrl => throw UnimplementedError();

  @override
  String get tradingViewUrl => throw UnimplementedError();
}
