import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/splash/presentation/viewmodels/splash_cubit/splash_cubit.dart';
import 'package:book_pulse_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..start(),
      child: const Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SplashViewBody(),
      ),
    );
  }
}
