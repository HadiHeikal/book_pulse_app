import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A small vertical book thumbnail used in the "You can also like" horizontal list.
class BookDetailsRelatedItem extends StatelessWidget {
  final BookModel book;

  const BookDetailsRelatedItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.bookDetails,
          extra: book,
        );
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.coverUrl,
                width: 80,
                height: 110,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 80,
                    height: 110,
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
                  width: 80,
                  height: 110,
                  color: AppColors.cardColorDark,
                  child: const Icon(
                    Icons.book_rounded,
                    color: AppColors.gold,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
