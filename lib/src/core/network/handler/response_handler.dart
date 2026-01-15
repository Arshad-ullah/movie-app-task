import 'package:dio/dio.dart';
import 'package:movie_app/src/core/error/exception.dart';

class ResponseHandler {
  Map<String, dynamic> handleResponse(Response response) {
    if (_isSuccessful(response.statusCode)) {
      return _parseResponseData(response.data);
    }

    throw ServerException(
      'Server error: ${response.statusCode} ${response.statusMessage}',
    );
  }

  bool _isSuccessful(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  Map<String, dynamic> _parseResponseData(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    } else if (data is List && data.isNotEmpty) {
      if (data.first is Map<String, dynamic>) {
        return data.first as Map<String, dynamic>;
      }
    }
    throw const FormatException('Invalid response format');
  }
}
