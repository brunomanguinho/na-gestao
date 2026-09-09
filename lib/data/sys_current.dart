//import 'package:gestao/services/storage.dart';

class SysCurrent {
  static String? _token;

  static String? get token => _token;

  static set token(String token) => _token = token;

  static void clearData() {
    _token = null;
  }
}
