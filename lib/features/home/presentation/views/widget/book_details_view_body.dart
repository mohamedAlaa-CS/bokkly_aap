import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widget/similler_books_list_view.dart';
import 'package:flutter/material.dart';

import 'book_action.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * .24),
                    child: CustomBookImage(
                        imageUrl:
                            bookModel.volumeInfo!.imageLinks?.thumbnail ?? ''),
                  ),
                  const SizedBox(height: 43),
                  Text(
                    bookModel.volumeInfo!.title ?? '',
                    style: Styles.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Opacity(
                    opacity: .7,
                    child: Text(
                      bookModel.volumeInfo!.authors?[0] ?? '',
                      style: Styles.textStyle18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  BookRating(
                      count: bookModel.volumeInfo!.ratingsCount ?? 0,
                      rating: bookModel.volumeInfo!.averageRating ?? 0,
                      mainAxisAlignment: MainAxisAlignment.center),
                  const SizedBox(height: 30),
                  BookAction(urlBook: bookModel.volumeInfo!.previewLink ?? ''),
                  const Expanded(child: SizedBox(height: 50)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  const SimallerListview(),
                  const SizedBox(height: 40)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
