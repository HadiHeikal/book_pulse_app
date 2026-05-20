import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: OnboardingViewBody(),
      ),
    );
  }
}
