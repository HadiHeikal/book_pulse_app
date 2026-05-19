import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/services/api_service_locaor.dart';
import 'package:book_pulse_app/features/home/data/repos/home_repo.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/featured_books_cubit/featured_book_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/viewmodels/top_rated_cubit/top_rated_cubit.dart';
import 'package:book_pulse_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BookPulse());
}

class BookPulse extends StatelessWidget {
  const BookPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(homeRepo: getIt.get<HomeRepo>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(homeRepo: getIt.get<HomeRepo>())
                ..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              TopRatedCubit(homeRepo: getIt.get<HomeRepo>())
                ..fetchTopRatedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(homeRepo: getIt.get<HomeRepo>())
                ..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'BookPulse',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.mainColor,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
