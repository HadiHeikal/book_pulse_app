import 'package:bloc/bloc.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    // dependency injection using constructor injection
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      onSuccess: (booksList) {
        emit(FeaturedBookSuccess(books: booksList));
      },
      onFailure: (apiError) {
        emit(FeaturedBookFailure(errorMessage: apiError.message));
      },
    );
  }
}
