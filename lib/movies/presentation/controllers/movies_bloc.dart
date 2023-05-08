import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_event.dart';
import 'package:movies/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesFunc);

    on<GetPopularMoviesEvent>(_getPopularMoviesFunc);

    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesFunc);
  }

  FutureOr<void> _getNowPlayingMoviesFunc(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();

    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingMoviesRequestState: RequestState.error,
              nowPlayingMoviesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingMoviesList: r,
              nowPlayingMoviesRequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMoviesFunc(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase.execute();

    result.fold(
        (l) => emit(state.copyWith(
              popularMoviesRequestState: RequestState.error,
              popularMoviesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularMoviesList: r,
              popularMoviesRequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMoviesFunc(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
        (l) => emit(state.copyWith(
              topRatedMoviesRequestState: RequestState.error,
              topRatedMoviesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedMoviesList: r,
              topRatedMoviesRequestState: RequestState.loaded,
            )));
  }
}
