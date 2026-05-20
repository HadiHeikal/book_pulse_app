import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/continue_reading_card.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ContinueReadingSection extends StatelessWidget {
  const ContinueReadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Continue Reading'),
        const Gap(16),
        SizedBox(
          height: 240,
          child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              if (state is NewestBooksFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else if (state is NewestBooksLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.gold),
                );
              } else if (state is NewestBooksSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) =>
                      ContinueReadingCard(book: state.books[index]),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
