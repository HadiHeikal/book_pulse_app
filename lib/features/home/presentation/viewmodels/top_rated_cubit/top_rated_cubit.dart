import 'package:bloc/bloc.dart';
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
      onSuccess: (book) {
        emit(TopRatedSuccess(book: book.first));
      },
      onFailure: (apiError) {
        emit(TopRatedFailure(errorMessage: apiError.message));
      },
    );
  }
}
