import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_movie_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getMovieRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsFunc);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendationsFunc);
  }

  FutureOr<void> _getMovieDetailsFunc(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieId: event.movieId));

    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsRequestState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsRequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getMovieRecommendationsFunc(
      GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationsUseCase(
        MovieRecommendationsParameters(event.movieId));

    result.fold(
        (l) => emit(state.copyWith(
              movieRecommendationsRequestState: RequestState.error,
              movieRecommendationsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieRecommendationsList: r,
              movieRecommendationsRequestState: RequestState.loaded,
            )));
  }
}
