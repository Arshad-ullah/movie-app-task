import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_app/src/core/error/exception.dart';

class ErrorHandler {
  /// Handles errors and converts them to AppException
  AppException handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    }
    return ServerException(error.toString());
  }

  /// Handle DioException based on type
  AppException _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return _handleTimeoutError();

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.connectionError:
        return _handleConnectionError(error);

      case DioExceptionType.cancel:
        return const ServerException('Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const ServerException('Certificate verification failed.');

      case DioExceptionType.unknown:
        return _handleUnknownError(error);
    }
  }

  /// Handle timeout errors
  AppException _handleTimeoutError() {
    return const TimeoutException('Request timeout. Please try again.');
  }

  /// Handle bad response errors (4xx, 5xx status codes)
  AppException _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;

    switch (statusCode) {
      case 401:
        return const UnauthorizedException('Unauthorized. Please login again.');
      case 403:
        return const UnauthorizedException(
          'Access forbidden. You don\'t have permission.',
        );
      case 404:
        return const ServerException('Resource not found.');
      case 500:
        return const ServerException('Server error. Please try again later.');
      default:
        return ServerException(
          error.response?.data?['message'] ?? 'Server error occurred',
        );
    }
  }

  /// Handle connection errors
  AppException _handleConnectionError(DioException error) {
    if (error.error is SocketException) {
      return const NetworkException(
        'No internet connection. Please check your network.',
      );
    }
    return const ServerException(
      'Connection error. Please check your internet connection.',
    );
  }

  /// Handle unknown errors
  AppException _handleUnknownError(DioException error) {
    if (error.error is SocketException) {
      return const NetworkException(
        'No internet connection. Please check your network.',
      );
    }
    return ServerException(error.message ?? 'An unexpected error occurred');
  }
}
