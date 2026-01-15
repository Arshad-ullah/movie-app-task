class ApiEndpoints {
  ApiEndpoints._(); // private constructor

  static const String apiKey = "25abef6e5e00979345d05bdca0a4890e";
  static const String baseUrl = "https://api.themoviedb.org/3/movie";

  /// Upcoming Movies
  static String upcomingMovies() {
    return "$baseUrl/upcoming?api_key=$apiKey";
  }

  /// Movie Details
  static String movieDetails(String movieId) {
    return "$baseUrl/$movieId?api_key=$apiKey";
  }

  static const imgBaseUrl = "https://image.tmdb.org/t/p/w500";
}
