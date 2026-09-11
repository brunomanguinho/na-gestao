import 'dart:convert';

import 'package:gestao/services/exceptions.dart';
import 'package:http/http.dart';

class API {
  static const String endPoint = 'localhost:3001';

  static Future<Map<String, dynamic>> GET(
    String route,
    Map<String, dynamic> params,
  ) async {
    final uri = Uri.http(endPoint, route, params);

    try {
      final response = await get(uri);

      if (response.statusCode != 200) {
        throw StatusCodeException(code: response.statusCode);
      }

      return jsonDecode(response.body) as Map<String, Object?>;
    } catch (e) {
      throw ApiCodeException(code: -1002);
    }
  }
}
