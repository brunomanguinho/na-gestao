import 'dart:convert';
import 'dart:io';

import 'package:gestao/data/sys_current.dart';
import 'package:gestao/services/exceptions.dart';
import 'package:gestao/services/http_package.dart';
import 'package:http/http.dart';

class API {
  static const String endPoint = 'localhost:3001';

  static Future<Map<String, dynamic>> GET(
    String route,
    Map<String, dynamic> params,
  ) async {
    final uri = Uri.http(endPoint, route, params);

    Response response;
    try {
      String token = SysCurrent.token ?? "";

      response = await get(
        uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );

      if (response.statusCode != 200) {
        throw StatusCodeException(code: response.statusCode);
      }
    } on StatusCodeException {
      rethrow;
    } catch (e) {
      throw ApiCodeException(code: -1002);
    }

    Map<String, Object?> json =
        jsonDecode(response.body) as Map<String, Object?>;

    if ((json['error'] != null) && ((json['error'] as Map).isNotEmpty)) {
      final Map<String, dynamic> error = json['error'] as Map<String, dynamic>;
      final ErrorPackage errorPackage = ErrorPackage.fromMap(error);

      throw ApiCodeException(
        code: errorPackage.code,
        apiMessage: errorPackage.message,
      );
    }

    return json;
  }
}
