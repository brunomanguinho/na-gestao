import 'package:flutter/widgets.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/screens/index/view.dart';
import 'package:gestao/screens/login/view.dart';
import 'package:gestao/services/api.dart';
import 'package:gestao/services/http_package.dart';

import 'dart:convert';

import 'package:gestao/services/storage.dart';

// class Usuario {
//   factory Usuario({required Map<String, dynamic>? data}) {
//     Usuario._internal(
//       ID: 1,
//       Login: 'bruno',
//       Nome: 'manguinho',
//       Token: 'idjasdjiaoisj',
//     );
//   }

//   Usuario._internal({
//     required this.ID,
//     required this.Login,
//     required this.Nome,
//     required this.Token,
//   });

//   final int ID;
//   final String Login;
//   final String Nome;
//   final String Token;
// }

class AuthService {
  AuthService();

  Future<HttpPackage> login(String userName, String password) async {
    var params = <String, dynamic>{};

    params['login'] = userName;
    params['password'] = password;

    HttpPackage httpPackage = await API.GET('usuario/searchLogin', params);

    await writeToken(httpPackage.data['Token']);

    return httpPackage;
  }

  Future<void> writeToken(String token) async {
    await Storage.writeData('token', token);
    SysCurrent.token = token;
  }

  Future<void> restoreSession() async {
    final String? token = await Storage.readData('token');

    if (token == '' || token == null) {
      return;
    } else {
      SysCurrent.token = token;
    }
  }

  Future<void> validateToken(String token) async {
    var params = <String, dynamic>{};

    params['Token'] = token;

    final httpPackage = await API.GET('usuario/me', params);
  }
}
