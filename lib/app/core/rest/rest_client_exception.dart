import 'package:dio/dio.dart';
import 'package:mundi_flutter_platform_client_app/app/core/rest/rest_client_response.dart';

class RestClientException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  factory RestClientException.fromDioException(DioException e) {
    return RestClientException(
      error: e,
      response:
          e.response != null ? RestClientResponse.fromDio(e.response!) : null,
      message: e.message,
      statusCode: e.response?.statusCode,
    );
  }

  @override
  String toString() {
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
