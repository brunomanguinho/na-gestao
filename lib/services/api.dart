import 'dart:convert';

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
    //try {
    try {
      response = await get(uri);

      if (response.statusCode != 200) {
        throw StatusCodeException(code: response.statusCode);
      }
    } catch (e) {
      throw ApiCodeException(code: -1002);
    }

    Map<String, Object?> json =
        jsonDecode(response.body) as Map<String, Object?>;

    if (json['error'] != null) {
      final Map<String, dynamic> error = json['error'] as Map<String, dynamic>;
      final ErrorPackage errorPackage = ErrorPackage.fromMap(error);

      throw ApiCodeException(
        code: errorPackage.code,
        apiMessage: errorPackage.message,
      );
    }

    return json;
    //} catch (e) {
    //throw ApiCodeException(code: -1002);
    //}
  }
}
