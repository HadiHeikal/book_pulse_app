import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class FeaturedBooksSection extends StatefulWidget {
  final List<BookModel> books;

  const FeaturedBooksSection({super.key, required this.books});

  @override
  State<FeaturedBooksSection> createState() => _FeaturedBooksSectionState();
}

class _FeaturedBooksSectionState extends State<FeaturedBooksSection> {
  late PageController _pageController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.78, initialPage: 0);
    // it is used to update the current page when the user scrolls
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SectionHeader(title: 'Featured Books'),
        ),
        const Gap(16),
        SizedBox(
          height: 290,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.books.length,
            itemBuilder: (context, index) {
              final distance = (_currentPage - index).abs();
              final scale = (1 - distance * 0.1).clamp(0.88, 1.0);
              final opacity = (1 - distance * 0.35).clamp(0.55, 1.0);
              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity,
                  child: FeaturedBookCard(book: widget.books[index]),
                ),
              );
            },
          ),
        ),
        const Gap(26),
        // Page indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.books.length, (index) {
            final isActive = _currentPage.round() == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 22 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.gold
                    : AppColors.gold.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
