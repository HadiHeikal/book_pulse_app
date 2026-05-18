import 'package:book_pulse_app/core/services/api_service.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
// inject dependencies in lazy loading so it will created only once and shared every where
void setupServiceLocator() {
  // Api Service
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Home repo implementation
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt.get<ApiService>()),
  );
}
