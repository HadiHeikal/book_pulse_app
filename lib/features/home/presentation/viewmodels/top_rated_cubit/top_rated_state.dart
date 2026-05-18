part of 'top_rated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final BookModel book;
  const TopRatedSuccess({required this.book});
  @override
  List<Object> get props => [book];
}

final class TopRatedFailure extends TopRatedState {
  final String errorMessage;
  const TopRatedFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
