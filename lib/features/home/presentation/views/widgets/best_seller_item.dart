import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;

  const BestSellerItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          // Book cover
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              book.coverUrl,
              width: 64,
              height: 88,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 64,
                  height: 88,
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
                width: 64,
                height: 88,
                color: AppColors.cardColorDark,
                child: const Icon(Icons.book, color: AppColors.gold, size: 28),
              ),
            ),
          ),
          const Gap(14),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bookTitle,
                ),
                const Gap(4),
                Text(book.author, style: AppTextStyles.authorName),
                const Gap(8),
                Row(
                  children: [
                    Text(
                      '€ ${book.price.toStringAsFixed(2)}',
                      style: AppTextStyles.price,
                    ),
                    const Gap(14),
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.gold,
                      size: 14,
                    ),
                    const Gap(3),
                    Text(
                      '${book.rating}',
                      style: AppTextStyles.price.copyWith(
                        color: AppColors.gold,
                        fontSize: 12,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '(${book.ratingCount})',
                      style: AppTextStyles.ratingCount,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Trailing menu icon
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: AppColors.textHint),
            color: AppColors.cardColor,
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'wishlist',
                child: Text(
                  'Add to Wishlist',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'share',
                child: Text(
                  'Share',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'details',
                child: Text(
                  'View Details',
                  style: AppTextStyles.body.copyWith(color: AppColors.gold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
