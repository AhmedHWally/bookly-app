import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view_item.dart';

class NewestBooksList extends StatelessWidget {
  const NewestBooksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => BookListViewItem(
                      book: state.newestBooks[index],
                    ),
                childCount: state.newestBooks.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return const SliverFillRemaining(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
