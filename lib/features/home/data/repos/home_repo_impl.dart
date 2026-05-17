import 'package:book_pulse_app/core/constants/app_strings.dart';
import 'package:book_pulse_app/core/services/api_exceptions.dart';
import 'package:book_pulse_app/core/services/api_service.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Result<List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: searchFreeNewestBooksEndpoint);

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return Success(books);
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    }
  }
}
