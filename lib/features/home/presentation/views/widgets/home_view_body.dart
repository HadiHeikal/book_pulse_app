import 'package:book_pulse_app/features/home/presentation/viewmodels/home_viewmodel.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/continue_reading_section.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/custom_book_pulse_appbar.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/featured_books_section.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/section_header.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/top_rated_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ─── Safe area + App Bar ──────────────────────────────────
        SliverToBoxAdapter(child: Gap(topPadding + 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const CustomBookPulseAppBar(),
          ),
        ),
        const SliverToBoxAdapter(child: Gap(28)),

        // ─── Featured Books ───────────────────────────────────────
        SliverToBoxAdapter(child: FeaturedBooksSection()),
        const SliverToBoxAdapter(child: Gap(32)),

        // ─── Continue Reading ─────────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ContinueReadingSection(),
          ),
        ),
        const SliverToBoxAdapter(child: Gap(32)),

        // ─── Top Rated ────────────────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TopRatedSection(book: viewModel.topRatedBook),
          ),
        ),
        const SliverToBoxAdapter(child: Gap(32)),

        // ─── Best Sellers Header ──────────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SectionHeader(title: 'Best Seller'),
          ),
        ),
        const SliverToBoxAdapter(child: Gap(16)),

        // ─── Best Sellers SliverList ──────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  BestSellerItem(book: viewModel.bestSellers[index]),
              childCount: viewModel.bestSellers.length,
            ),
          ),
        ),

        // ─── Bottom padding ───────────────────────────────────────
        const SliverToBoxAdapter(child: Gap(32)),
      ],
    );
  }
}
