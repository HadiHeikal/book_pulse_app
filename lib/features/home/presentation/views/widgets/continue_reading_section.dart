import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/continue_reading_card.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ContinueReadingSection extends StatelessWidget {
  final List<BookModel> books;

  const ContinueReadingSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Continue Reading'),
        const Gap(16),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) =>
                ContinueReadingCard(book: books[index]),
          ),
        ),
      ],
    );
  }
}
