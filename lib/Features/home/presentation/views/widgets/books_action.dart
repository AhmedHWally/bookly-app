import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/functions/lunch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(children: [
        Expanded(
            child: CustomButton(
          backGroundColor: Colors.white,
          textBody: 'Free',
          radius: const BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          textStyle: Styles.textStyle18
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: CustomButton(
          onPressed: () {
            launchCustomUrl(context, bookModel.volumeInfo.previewLink);
          },
          backGroundColor: const Color(0xffEF8262),
          radius: const BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          textBody: getText(bookModel),
          textStyle:
              Styles.textStyle18.copyWith(color: Colors.white, fontSize: 16),
        ))
      ]),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not avilable';
    } else {
      return 'Preview';
    }
  }
}
