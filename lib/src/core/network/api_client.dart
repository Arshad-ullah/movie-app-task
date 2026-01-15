/// Abstract class for API client
abstract class ApiClient {
  Future<Map<String, dynamic>> get(String endpoint);
}
