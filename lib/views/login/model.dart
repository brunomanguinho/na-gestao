import 'package:gestao/data/sys_current.dart';
import 'package:gestao/data/usuario.dart';
import 'package:gestao/services/api.dart';
import 'package:gestao/services/exceptions.dart';
import 'package:gestao/services/http_package.dart';
import 'package:gestao/services/storage.dart';

class AuthService {
  AuthService();

  Future<HttpPackage<Usuario>> login(String userName, String password) async {
    var params = <String, dynamic>{};

    params['login'] = userName;
    params['password'] = password;

    final Map<String, dynamic> response = await API.GET(
      'usuario/searchLogin',
      params,
    );

    HttpPackage<Usuario> httpPackage = HttpPackage.fromMap(
      response,
      Usuario.fromMap,
    );

    if (!httpPackage.success) {
      throw ApiCodeException(code: httpPackage.error!.code);
    }

    await writeUserData((httpPackage.data as Usuario));

    return httpPackage;
  }

  Future<void> writeUserData(Usuario usuario) async {
    await Storage.writeData('token', usuario.Token);
    await Storage.writeData('username', usuario.Nome);

    SysCurrent.token = usuario.Token;
    SysCurrent.username = usuario.Nome;
  }

  Future<void> restoreSession() async {
    final String? token = await Storage.readData('token');

    if (token == '' || token == null) {
      return;
    } else {
      await validateToken(token);
    }
  }

  Future<bool> validateToken(String token) async {
    var params = <String, dynamic>{};

    params['token'] = token;

    final Map<String, dynamic> response = await API.GET('usuario/me', params);

    if (response['data']['Token'] != token) {
      SysCurrent.clearData;
      return false;
    } else {
      SysCurrent.token = token;
      return true;
    }
  }
}
