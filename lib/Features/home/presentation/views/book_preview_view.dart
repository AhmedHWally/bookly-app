import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_preview_view_body.dart';
import 'package:flutter/material.dart';

class BookPreviewView extends StatelessWidget {
  const BookPreviewView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookModel.volumeInfo.title!),
      ),
      body: BookPreviewViewBody(book: bookModel),
    );
  }
}
