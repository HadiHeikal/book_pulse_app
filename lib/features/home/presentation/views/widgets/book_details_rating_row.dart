import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

/// Star rating + review count row displayed under the author name.
class BookDetailsRatingRow extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const BookDetailsRatingRow({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star_rounded, color: AppColors.gold, size: 20),
        const Gap(6),
        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.bookTitle.copyWith(
            color: AppColors.gold,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(6),
        Text(
          '($ratingCount)',
          style: AppTextStyles.ratingCount.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
