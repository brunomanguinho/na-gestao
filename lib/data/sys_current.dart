class SysCurrent {
  static String? _token;
  static String? _username;

  static String? get token => _token;
  static String? get username => _username;

  static set token(String token) => _token = token;
  static set username(String username) => _username = username;

  static void clearData() {
    _token = null;
    _username = null;
  }
}
