import 'package:book_pulse_app/core/constants/app_strings.dart';
import 'package:book_pulse_app/core/services/api_exceptions.dart';
import 'package:book_pulse_app/core/services/api_service.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  // helper method to parse books from API response
  List<BookModel> _parseBooks(Map<String, dynamic> data) {
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  // fetch newest books from API
  @override
  Future<Result<List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: searchFreeNewestBooksEndpoint);

      return Success(_parseBooks(data));
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    }
  }

  // fetch featured books from API
  @override
  Future<Result<List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: searchFeaturedBooksEndpoint);

      return Success(_parseBooks(data));
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    }
  }

  // fetch best seller books from API
  @override
  Future<Result<List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(endPoint: searchBestSellerBooksEndpoint);

      return Success(_parseBooks(data));
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    }
  }

  // fetch top rated books from API
  @override
  Future<Result<List<BookModel>>> fetchTopRatedBooks() async {
    try {
      var data = await apiService.get(endPoint: searchTopRatedBooksEndpoint);

      return Success(_parseBooks(data));
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    }
  }
}
