import 'dart:convert';

import 'package:gestao/services/http_package.dart';
import 'package:http/http.dart';

import 'dart:io';

class API {
  static const String endPoint = 'localhost:3001';

  static Future<Map<String, dynamic>> GET(
    String route,
    Map<String, dynamic> params,
  ) async {
    final uri = Uri.http(endPoint, route, params);
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw const HttpException('Failed to get data');
    }

    return json.decode(response.body) as Map<String, dynamic>;
  }

  // static Future<HttpPackage> GET(
  //   String route,
  //   Map<String, dynamic> params,
  // ) async {
  //   final uri = Uri.http(endPoint, route, params);
  //   final response = await get(uri);

  //   // final response = await get(
  //   //   uri,
  //   //   headers: token != null ? {'Authorization': 'Bearer $token'} : null,
  //   // );

  //   if (response.statusCode != 200) {
  //     throw const HttpException('Failed to get data');
  //   }

  //   final Map<String, dynamic> responsePackage =
  //       json.decode(response.body) as Map<String, dynamic>;

  //   final httpPackage = HttpPackage.fromMap(responsePackage);

  //   return httpPackage;
  // }
}
