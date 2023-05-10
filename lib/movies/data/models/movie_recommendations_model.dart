import 'package:movies/movies/domain/entities/movie_recommendations.dart';

class MovieRecommendationsModel extends MovieRecommendations {
  const MovieRecommendationsModel(
      {super.backdropPath, required super.id});

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> objectJson) {
    return MovieRecommendationsModel(
      id: objectJson["id"],
      backdropPath: objectJson["backdrop_path"] ?? "/7bWxAsNPv9CXHOhZbJVlj2KxgfP.jpg",
    );
  }
}
