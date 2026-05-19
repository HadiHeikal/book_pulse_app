import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.homeRepo}) : super(NewestBooksInitial());
  // dependency injection using constructor injection
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      onSuccess: (booksList) {
        emit(NewestBooksSuccess(books: booksList));
      },
      onFailure: (apiError) {
        emit(NewestBooksFailure(errorMessage: apiError.message));
      },
    );
  }
}
