import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Displays the hero book cover image in a floating card with shadow glow.
class BookDetailsCoverCard extends StatelessWidget {
  final String coverUrl;
  final String heroTag;

  const BookDetailsCoverCard({
    super.key,
    required this.coverUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Container(
        width: 180,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.18),
              blurRadius: 40,
              spreadRadius: 4,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            coverUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: AppColors.cardColorDark,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.gold,
                    strokeWidth: 2,
                  ),
                ),
              );
            },
            errorBuilder: (_, _, _) => Container(
              color: AppColors.cardColorDark,
              child: const Icon(
                Icons.book_rounded,
                color: AppColors.gold,
                size: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
