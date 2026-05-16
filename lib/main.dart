import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BookPulse());
}

class BookPulse extends StatelessWidget {
  const BookPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mainColor,
      ),
      home: const SplashView(),
    );
  }
}
