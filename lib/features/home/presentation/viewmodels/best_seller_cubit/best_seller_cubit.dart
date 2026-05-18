import 'package:bloc/bloc.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit({required this.homeRepo}) : super(BestSellerInitial());
  // dependency injection using constructor injection
  final HomeRepo homeRepo;
  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      onSuccess: (booksList) {
        emit(BestSellerSuccess(books: booksList));
      },
      onFailure: (apiError) {
        emit(BestSellerFailure(errorMessage: apiError.message));
      },
    );
  }
}
