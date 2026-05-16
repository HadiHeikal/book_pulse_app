import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookPulse());
}

class BookPulse extends StatelessWidget {
  const BookPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BookPulse',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mainColor,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
