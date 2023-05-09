part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetail;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsRequestState,
        movieDetailsMessage,
      ];
}
