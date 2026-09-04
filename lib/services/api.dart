import 'package:http/http.dart';

import 'dart:io';

class API {
  API({this.endPoint = 'localhost:3001'});

  final String endPoint;

  Future<String> GET(String route, Map<String, dynamic> params) async {
    final uri = Uri.http(endPoint, route, params);

    final response = await get(uri);

    if (response.statusCode != 200) {
      throw const HttpException('Failed to get data');
    }

    return response.body;
  }
}
