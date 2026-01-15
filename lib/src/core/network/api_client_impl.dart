import 'package:dio/dio.dart';
import 'package:movie_app/src/core/error/exception.dart';
import 'package:movie_app/src/core/network/api_client.dart';
import 'package:movie_app/src/core/network/handler/error_handler.dart';
import 'package:movie_app/src/core/network/handler/response_handler.dart';
import 'package:movie_app/src/core/network/interceptor/login_interceptor.dart';

class ApiClientImpl implements ApiClient {
  final Dio _dio;
  final ResponseHandler _responseHandler;
  final ErrorHandler _errorHandler;

  ApiClientImpl({
    required Dio dio,
    ResponseHandler? responseHandler,
    ErrorHandler? errorHandler,
  }) : _dio = dio,
       _responseHandler = responseHandler ?? ResponseHandler(),
       _errorHandler = errorHandler ?? ErrorHandler() {
    _setupDio();
  }

  void _setupDio() {
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    // Add logging interceptor
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _responseHandler.handleResponse(response);
    } catch (e) {
      throw _errorHandler.handleError(e);
    }
  }
}
