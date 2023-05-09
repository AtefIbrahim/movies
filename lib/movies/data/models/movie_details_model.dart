import 'package:movies/movies/data/models/genre_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonObject) {
    return MovieDetailsModel(
      id: jsonObject["id"],
      title: jsonObject["title"],
      backdropPath: jsonObject["backdrop_path"],
      genres: List<GenreModel>.from(jsonObject["genres"].map((x) => GenreModel.fromJson(x))),
      overview: jsonObject["overview"],
      voteAverage: jsonObject["vote_average"].toDouble(),
      releaseDate: jsonObject["release_date"],
      runtime: jsonObject["runtime"],
    );
  }

}
