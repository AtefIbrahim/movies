part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetail;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<MovieRecommendations>? movieRecommendationsList;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = "",
    this.movieRecommendationsList = const [],
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetail,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<MovieRecommendations>? movieRecommendationsList,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsRequestState: movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendationsList: movieRecommendationsList ?? this.movieRecommendationsList,
      movieRecommendationsRequestState: movieRecommendationsRequestState ?? this.movieRecommendationsRequestState,
      movieRecommendationsMessage: movieRecommendationsMessage ?? this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsRequestState,
        movieDetailsMessage,
        movieRecommendationsList,
        movieRecommendationsRequestState,
        movieRecommendationsMessage
      ];
}
