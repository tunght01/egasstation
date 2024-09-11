import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dto/user_data_dto.dart';

@Injectable()
class LocalService {
  final String kKeyUid = 'key_uid';
  final String kKeyAuth = 'key_auth';
  final String rememberMe = 'rememberMe';
  final String kKeyUsername = 'key_username';
  final String kKeyCache = "key_cache";
  //NOTE: List key not delete when user logout
  final List<String> keyExcludes = [];

  final SharedPreferences sharedPreferences;

  LocalService(this.sharedPreferences);

  bool isAuthorized() {
    return sharedPreferences.containsKey(kKeyUid);
  }

  int? getUid() {
    if (isAuthorized()) {
      return sharedPreferences.getInt(kKeyUid);
    } else {
      return null;
    }
  }

  List<String> getListString(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  Future saveListString(List<String> data, String key) {
    return sharedPreferences.setStringList(key, data);
  }

  Future saveUid(int? uid) {
    if (uid == null) {
      return clear();
    } else {
      return sharedPreferences.setInt(kKeyUid, uid);
    }
  }

  Future clear() async {
    final keys = sharedPreferences.getKeys();
    keys.removeAll(keyExcludes);
    for (final key in keys) {
      await sharedPreferences.remove(key);
    }
  }

  Future saveAuth(UserDataDto? session) {
    if (session == null) {
      return clear();
    } else {
      return sharedPreferences.setString(kKeyAuth, json.encode(session.toJson()));
    }
  }

  Future<bool> getSaveLogin() async {
    return sharedPreferences.getBool(rememberMe) ?? false;
  }

  Future saveLogin(bool saveLogin) {
    return sharedPreferences.setBool(rememberMe, saveLogin);
  }

  Future saveUsername(String username) {
    return sharedPreferences.setString(kKeyUsername, username.toLowerCase());
  }

  String? getUsername() {
    return sharedPreferences.getString(kKeyUsername);
  }
}
