import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase extends BaseUseCase<List<MovieRecommendations>, MovieRecommendationsParameters> {
  BaseMoviesRepository baseMoviesRepository;
  GetMovieRecommendationsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(MovieRecommendationsParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendations(parameters);
  }
}

class MovieRecommendationsParameters extends Equatable
{
  final int id;
  const MovieRecommendationsParameters(this.id);

  @override
  List<Object> get props => [id];
}
