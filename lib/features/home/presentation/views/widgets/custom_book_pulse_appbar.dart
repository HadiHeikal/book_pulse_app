import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBookPulseAppBar extends StatelessWidget {
  const CustomBookPulseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Brand Image
        Image.asset('assets/images/logo/book-pulse.png', height: 70, width: 70),
        // Pulse icon
        const SizedBox(width: 6),

        const Spacer(),
        // Search icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: AppColors.gold,
              size: 16,
            ),
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(width: 12),
        // Avatar
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [AppColors.gold, AppColors.goldDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: AppColors.gold, width: 2),
          ),
          child: Center(
            child: Text(
              'H',
              style: GoogleFonts.poppins(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
