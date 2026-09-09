import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final storage = FlutterSecureStorage();

  static Future<void> writeData(String aKey, String aValue) async {
    await storage.write(key: aKey, value: aValue);
  }

  static Future<void> deleteData(String aKey) async {
    await storage.delete(key: aKey);
  }

  static Future<String?> readData(String aKey) async {
    return await storage.read(key: aKey);
  }
}
