import 'package:book_pulse_app/features/home/presentation/viewmodels/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_pulse_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerLoading) {
          return const SliverToBoxAdapter(child: CircularProgressIndicator());
        } else if (state is BestSellerFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is BestSellerSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => BestSellerItem(book: state.books[index]),
                childCount: state.books.length,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
