import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  /// now playing movies
  final List<Movie> nowPlayingMoviesList;
  final RequestState nowPlayingMoviesRequestState;
  final String nowPlayingMoviesMessage;

  /// now popular movies
  final List<Movie> popularMoviesList;
  final RequestState popularMoviesRequestState;
  final String popularMoviesMessage;

  /// top rated movies
  final List<Movie> topRatedMoviesList;
  final RequestState topRatedMoviesRequestState;
  final String topRatedMoviesMessage;

  const MoviesState(
      {this.nowPlayingMoviesList = const [],
      this.nowPlayingMoviesRequestState = RequestState.loading,
      this.nowPlayingMoviesMessage = '',
      this.popularMoviesList = const [],
      this.popularMoviesRequestState = RequestState.loading,
      this.popularMoviesMessage = '',
      this.topRatedMoviesList = const [],
      this.topRatedMoviesRequestState = RequestState.loading,
      this.topRatedMoviesMessage = ''});

  MoviesState copyWith(
      {List<Movie>? nowPlayingMoviesList,
      RequestState? nowPlayingMoviesRequestState,
      String? nowPlayingMoviesMessage,
      List<Movie>? popularMoviesList,
      RequestState? popularMoviesRequestState,
      String? popularMoviesMessage,
      List<Movie>? topRatedMoviesList,
      RequestState? topRatedMoviesRequestState,
      String? topRatedMoviesMessage}) {
    return MoviesState(
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      nowPlayingMoviesRequestState: nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
      nowPlayingMoviesMessage: nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      popularMoviesRequestState: popularMoviesRequestState ?? this.popularMoviesRequestState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
      topRatedMoviesRequestState: topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
      topRatedMoviesMessage: topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMoviesList,
        nowPlayingMoviesRequestState,
        nowPlayingMoviesMessage,
        popularMoviesList,
        popularMoviesRequestState,
        popularMoviesMessage,
        topRatedMoviesList,
        topRatedMoviesRequestState,
        topRatedMoviesMessage
      ];
}
