import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_action_buttons.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_cover_card.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_rating_row.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_related_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;

  const BookDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Background top section with blurred glow ─────────────
          Stack(
            children: [
              // Glow backdrop
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0, -0.3),
                      radius: 0.8,
                      colors: [
                        AppColors.gold.withValues(alpha: 0.07),
                        AppColors.mainColor,
                      ],
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Gap(topPadding + 12),

                  // ─── Header row: close + cart ──────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _IconButton(
                          icon: Icons.close_rounded,
                          onTap: () => context.pop(),
                        ),
                        _IconButton(
                          icon: Icons.shopping_cart_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  const Gap(28),

                  // ─── Book cover ────────────────────────────────────
                  Center(
                    child: BookDetailsCoverCard(
                      coverUrl: book.coverUrl,
                      heroTag: 'book_cover_${book.id}',
                    ),
                  ),

                  const Gap(32),
                ],
              ),
            ],
          ),

          // ─── Title ────────────────────────────────────────────────
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                book.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.bookTitleLarge.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),

          const Gap(8),

          // ─── Author ───────────────────────────────────────────────
          Center(
            child: Text(
              book.author,
              style: AppTextStyles.authorName.copyWith(fontSize: 14),
            ),
          ),

          const Gap(12),

          // ─── Rating row ───────────────────────────────────────────
          Center(
            child: BookDetailsRatingRow(
              rating: book.rating,
              ratingCount: book.ratingCount,
            ),
          ),

          const Gap(28),

          // ─── Action buttons ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BookDetailsActionButtons(
              price: book.price,
              previewUrl: book.previewUrl,
            ),
          ),

          const Gap(36),

          // ─── Description ──────────────────────────────────────────
          if (book.description.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'About this book',
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 16),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                book.description,
                style: AppTextStyles.body.copyWith(fontSize: 13, height: 1.7),
              ),
            ),
            const Gap(32),
          ],

          // ─── You can also like ────────────────────────────────────
          BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksLoading) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 32 + bottomPadding),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.gold),
                  ),
                );
              }

              if (state is SimilarBooksFailure) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 32 + bottomPadding),
                  child: Text(
                    state.errorMessage,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              }

              if (state is SimilarBooksSuccess && state.books.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'You can also like',
                        style: AppTextStyles.sectionTitle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: state.books.length,
                        itemBuilder: (context, index) =>
                            BookDetailsRelatedItem(book: state.books[index]),
                      ),
                    ),
                    Gap(32 + bottomPadding),
                  ],
                );
              }

              return Gap(32 + bottomPadding);
            },
          ),
        ],
      ),
    );
  }
}

// ─── Internal small icon button ──────────────────────────────────────────────

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
    );
  }
}
