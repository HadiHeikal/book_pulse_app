import 'package:book_pulse_app/core/constants/app_strings.dart';
import 'package:book_pulse_app/core/utils/pref_helpers.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {"Content-Type": "application/json"},
    ),
  );

  DioClient() {
    // interceptors to add token to requests
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get token from SharedPreferences
          final token = await PrefHelper.getToken();
          // Add token to request headers if it exists
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
