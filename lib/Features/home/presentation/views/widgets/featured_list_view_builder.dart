import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.28,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                    extra: state.featuredBooks[index]);
              },
              child: CustomBookImage(
                  imageUrl: state.featuredBooks[index].volumeInfo.imageLinks
                          ?.thumbnail ??
                      ''),
            ),
            itemCount: state.featuredBooks.length,
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return Center(child: CustomErrorWidget(errMessage: state.errMessage));
      }
      return const CustomLoadingIndicator();
    });
  }
}
