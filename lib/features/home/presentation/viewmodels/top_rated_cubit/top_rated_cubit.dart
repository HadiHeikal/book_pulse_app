import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit({required this.homeRepo}) : super(TopRatedInitial());
  // dependency injection using constructor injection
  final HomeRepo homeRepo;
  Future<void> fetchTopRatedBooks() async {
    emit(TopRatedLoading());
    var result = await homeRepo.fetchTopRatedBooks();
    result.fold(
      onSuccess: (books) {
        if (books.isEmpty) {
          emit(const TopRatedFailure(errorMessage: 'No top rated books found'));
          return;
        }

        final ratedBooks =
            books
                .where((book) => book.rating > 0 && book.coverUrl.isNotEmpty)
                .toList()
              ..sort((a, b) => b.rating.compareTo(a.rating));
        final topRatedBook =
            ratedBooks.cast<BookModel?>().firstWhere(
              (book) => book?.rating == 5.0,
              orElse: () => ratedBooks.isNotEmpty ? ratedBooks.first : null,
            ) ??
            books.first;

        emit(TopRatedSuccess(book: topRatedBook));
      },
      onFailure: (apiError) {
        emit(TopRatedFailure(errorMessage: apiError.message));
      },
    );
  }
}
