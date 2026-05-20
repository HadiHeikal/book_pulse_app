import 'package:book_pulse_app/core/utils/pref_helpers.dart';
import 'package:book_pulse_app/routes/app_routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> start() async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 2));

    final hasSeenOnboarding = await PrefHelper.hasSeenOnboarding();
    emit(
      SplashSuccess(
        nextRoute: hasSeenOnboarding ? AppRoutes.home : AppRoutes.onboarding,
      ),
    );
  }
}
