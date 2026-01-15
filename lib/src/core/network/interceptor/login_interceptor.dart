import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      _logRequest(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      _logResponse(response);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      _logError(err);
    }
    super.onError(err, handler);
  }

  void _logRequest(RequestOptions options) {
    debugPrint('╔════════════════════════════════════════════════════════════');
    debugPrint('║ REQUEST[${options.method}] => ${options.path}');
    debugPrint('║ Query Parameters: ${options.queryParameters}');
    if (options.data != null) {
      debugPrint('║ Data: ${options.data}');
    }
    debugPrint('╚════════════════════════════════════════════════════════════');
  }

  void _logResponse(Response response) {
    debugPrint('╔════════════════════════════════════════════════════════════');
    debugPrint(
      '║ RESPONSE[${response.statusCode}] => ${response.requestOptions.path}',
    );
    debugPrint('╚════════════════════════════════════════════════════════════');
  }

  void _logError(DioException err) {
    debugPrint('╔════════════════════════════════════════════════════════════');
    debugPrint(
      '║ ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}',
    );
    debugPrint('║ Message: ${err.message}');
    debugPrint('╚════════════════════════════════════════════════════════════');
  }
}
