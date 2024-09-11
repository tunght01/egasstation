import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../global/untils/encryption.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  final Encryption _encryption = Encryption();

  saveUser(String user) async {
    await _storage.write(key: 'us', value: _encryption.encrypt(user));
  }

  Future<String> getUser() async {
    var user = await _storage.read(key: 'us') != null
        ? _encryption.decrypt(await _storage.read(key: 'us') ?? '')
        : "";
    return user;
  }

  removeUser() {
    _storage.delete(key: 'us');
  }

  savePassword(String password) async {
    await _storage.write(key: 'pw', value: _encryption.encrypt(password));
  }

  Future<String> getPassword() async {
    String pw = await _storage.read(key: 'pw') != null
        ? _encryption.decrypt(await _storage.read(key: 'pw') ?? '')
        : "";
    return pw;
  }

  removePassword() {
    _storage.delete(key: 'pw');
  }
}
