import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/models/movie_recommendations_model.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_movie_recommendations_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<List<MovieRecommendationsModel>> getMovieRecommendation(
      MovieRecommendationsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    print(AppConstants.movieDetailsUrl(parameters.movieId));
    final response = await Dio()
        .get(AppConstants.movieDetailsUrl(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendation(
      MovieRecommendationsParameters parameters) async {
    print(AppConstants.recommendationsMoviesUrl(parameters.id));
    final response = await Dio()
        .get(AppConstants.recommendationsMoviesUrl(parameters.id));

    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List).map((e)=> MovieRecommendationsModel.fromJson(e))) ;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
