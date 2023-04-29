import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';

import 'custom_app_bar.dart';
import 'featured_list_view_builder.dart';
import 'package:flutter/material.dart';

import 'newest_books_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.only(left: kPaddingValue, top: 20),
                child: Text(
                  'Newest books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const NewestBooksList()
      ],
    );
  }
}
