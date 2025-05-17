import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class RestClientResponse<T> {
  T? data;
  int? statusCode;
  String? message;
  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory RestClientResponse.fromHttp(http.Response response) {
    final res = jsonDecode(response.body);
    return RestClientResponse(
        data: res['data'],
        message: res['message'],
        statusCode: response.statusCode);
  }

  factory RestClientResponse.fromDio(Response<dynamic> response) {
    return RestClientResponse(
      data: response.data,
      message: response.statusMessage,
      statusCode: response.statusCode,
    );
  }
}
