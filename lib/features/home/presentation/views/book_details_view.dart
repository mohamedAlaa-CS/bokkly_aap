import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manager/simailar_books_cubit/simailer_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  static const String routeName = '/bookDetailsView';
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimailerBooksCubit>(context).fetchSimilarBook(
        category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(bookModel: widget.bookModel),
    );
  }
}
