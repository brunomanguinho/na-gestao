import 'package:gestao/services/api.dart';

import 'dart:convert';

class Usuario {
  Usuario({
    required this.ID,
    required this.Login,
    required this.Nome,
    required this.Email,
    required this.Token,
  });

  final int ID;
  final String Login;
  final String Nome;
  final String Email;
  final String Token;
}

class Login {
  Login();

  Future<String> login(String userName, String password) async {
    final API api = API();

    var params = <String, dynamic>{};

    params['login'] = userName;

    String response = await api.GET('usuario/searchLogin', params);

    final httpPackage = json.decode(response) as Map<String, dynamic>;

    print('package - ${httpPackage['Nome']}');

    return response;
  }
}
