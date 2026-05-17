import 'package:book_pulse_app/core/services/api_error.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';

abstract class HomeRepo {
  Future<Result<List<BookModel>>> fetchNewestBooks();
}

sealed class Result<T> {
  const Result();

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiError failure) onFailure,
  }) => switch (this) {
    Success(:final data) => onSuccess(data),
    Failure(:final failure) => onFailure(failure),
  };
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final ApiError failure;
  const Failure(this.failure);
}
