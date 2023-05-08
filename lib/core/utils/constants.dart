class AppConstants
{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String movieApiKey = "19ca12ce13e8ea4632c67a9ae94636aa";

  static const String nowPlayingMoviesUrl = "${AppConstants.baseUrl}/movie/now_playing?api_key=${AppConstants.movieApiKey}";
  static const String popularMoviesUrl = "${AppConstants.baseUrl}/movie/popular?api_key=${AppConstants.movieApiKey}";
  static const String topRatedMoviesUrl = "${AppConstants.baseUrl}/movie/top_rated?api_key=${AppConstants.movieApiKey}";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => baseImageUrl + path;
}