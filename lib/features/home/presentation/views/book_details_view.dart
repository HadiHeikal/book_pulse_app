import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/services/api_service_locaor.dart';
import 'package:book_pulse_app/features/home/data/models/book_model.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel book;

  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (context) =>
            SimilarBooksCubit(homeRepo: getIt.get<HomeRepo>())
              ..fetchSimilarBooks(book),
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: BookDetailsViewBody(book: book),
        ),
      ),
    );
  }
}
