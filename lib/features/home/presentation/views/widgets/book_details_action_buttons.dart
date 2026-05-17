import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

/// The pill-shaped action row with price on the left and "Free Preview" on the right.
class BookDetailsActionButtons extends StatelessWidget {
  final double price;

  const BookDetailsActionButtons({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          // ─── Price button ─────────────────────────────────────────
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(32),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${price.toStringAsFixed(2)}€',
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          // ─── Free Preview button ──────────────────────────────────
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffF28C28), Color(0xffE05F00)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(32),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Free preview',
                  style: AppTextStyles.sectionTitle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
