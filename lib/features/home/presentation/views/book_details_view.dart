import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel book;
  final List<BookModel> relatedBooks;

  const BookDetailsView({
    super.key,
    required this.book,
    required this.relatedBooks,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: BookDetailsViewBody(book: book, relatedBooks: relatedBooks),
      ),
    );
  }
}
