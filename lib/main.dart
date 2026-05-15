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
      home: SplashView(),
    );
  }
}
