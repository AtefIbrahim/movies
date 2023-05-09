import 'package:movies/movies/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> jsonObject) {
    return GenreModel(id: jsonObject["id"], name: jsonObject["name"]);
  }
}
