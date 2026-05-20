import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo}) : super(SimilarBooksInitial());

  static const int similarBooksCount = 10;

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(BookModel book) async {
    emit(SimilarBooksLoading());
    final result = await homeRepo.fetchSimilarBooks(book);
    result.fold(
      onSuccess: (books) {
        emit(
          SimilarBooksSuccess(books: books.take(similarBooksCount).toList()),
        );
      },
      onFailure: (apiError) {
        emit(SimilarBooksFailure(errorMessage: apiError.message));
      },
    );
  }
}
