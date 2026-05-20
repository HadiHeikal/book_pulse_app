import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:book_pulse_app/core/utils/pref_helpers.dart';
import 'package:book_pulse_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  static const List<_OnboardingItem> _items = [
    _OnboardingItem(
      icon: Icons.auto_stories_rounded,
      title: 'Discover your next read',
      subtitle: 'Explore featured, best seller, newest, and top rated books.',
    ),
    _OnboardingItem(
      icon: Icons.star_rounded,
      title: 'Find books readers love',
      subtitle: 'Open every book details page with ratings and similar picks.',
    ),
    _OnboardingItem(
      icon: Icons.bookmark_added_rounded,
      title: 'Keep reading easily',
      subtitle: 'Jump into a calm library experience made for daily reading.',
    ),
  ];

  bool get _isLastPage => _currentIndex == _items.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, topPadding > 0 ? 8 : 24, 24, 24),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo/book-pulse.png', height: 38),
                const Spacer(),
                TextButton(
                  onPressed: _finishOnboarding,
                  child: Text('Skip', style: AppTextStyles.seeAll),
                ),
              ],
            ),
            const Gap(36),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: _items.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return _OnboardingPage(item: item);
                },
              ),
            ),
            const Gap(24),
            Row(
              children: [
                Row(
                  children: List.generate(
                    _items.length,
                    (index) => _Dot(isActive: index == _currentIndex),
                  ),
                ),
                const Spacer(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.mainColor,
                    minimumSize: const Size(132, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _isLastPage ? _finishOnboarding : _goNext,
                  child: Text(
                    _isLastPage ? 'Start' : 'Next',
                    style: AppTextStyles.price.copyWith(
                      color: AppColors.mainColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Gap(bottomPadding),
          ],
        ),
      ),
    );
  }

  void _goNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
    );
  }

  Future<void> _finishOnboarding() async {
    await PrefHelper.setOnboardingSeen();
    if (mounted) {
      context.go(AppRoutes.home);
    }
  }
}

class _OnboardingPage extends StatelessWidget {
  final _OnboardingItem item;

  const _OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190,
          height: 190,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.divider),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withValues(alpha: 0.10),
                blurRadius: 42,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Icon(item.icon, color: AppColors.gold, size: 86),
        ),
        const Gap(42),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.bookTitleLarge.copyWith(fontSize: 26),
        ),
        const Gap(14),
        Text(
          item.subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.body.copyWith(fontSize: 14, height: 1.6),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;

  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: isActive ? 28 : 8,
      height: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.gold : AppColors.divider,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _OnboardingItem {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OnboardingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
