import 'package:encrypt/encrypt.dart';

class Encryption {
  final String _key = "cwJTc77dlw1Vzj9K46TJSM2TslI0SFjk";
  final _iv = IV.fromLength(16);
  late Encrypter _encrypter;

  Encryption() {
    _encrypter = Encrypter(AES(Key.fromUtf8(_key)));
  }

  String encrypt(String pass) {
    return _encrypter.encrypt(pass, iv: _iv).base64;
  }

  String decrypt(String encryptPass) {
    return _encrypter.decrypt64(encryptPass, iv: _iv);
  }
}
