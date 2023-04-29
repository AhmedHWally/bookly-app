import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.3,
            ),
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ??
                  'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg',
            )),
        const SizedBox(
          height: 43,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingValue),
          child: Text(book.volumeInfo.title!,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle30.copyWith(
                fontFamily: kGtSectraFine,
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? 'Un Known',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          count: book.volumeInfo.ratingsCount ?? 0,
          raitng: book.volumeInfo.averageRating ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 43,
        ),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
