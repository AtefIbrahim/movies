import 'package:movies/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> jsonObject) {
    return MovieModel(
      id: jsonObject["id"],
      title: jsonObject["title"],
      backdropPath: jsonObject["backdrop_path"],
      genreIds: List<int>.from(jsonObject["genre_ids"].map((e) => e)),
      overview: jsonObject["overview"],
      voteAverage: jsonObject["vote_average"].toDouble(),
      releaseDate: jsonObject["release_date"],
    );
  }
}
