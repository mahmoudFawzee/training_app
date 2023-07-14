import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_training/futures/data/keys/prefs_key.dart';

class SecureStorageService {
  static const secureStorage = FlutterSecureStorage();
  static Future<bool> storePass(
    String password,
  ) async {
    try {
      await secureStorage.write(
        key: PrefsKeys.pass,
        value: password,
      );
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<String?> getPass() async {
    final pass = await secureStorage.read(key: PrefsKeys.pass);
    print(pass);
    return pass;
  }
}
