import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(BookDetailsView.routeName);
      },
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      bookModel.volumeInfo?.title ?? '',
                      style: Styles.textStyle22,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookModel.volumeInfo!.authors![0],
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Free',
                          style: Styles.textStyle22
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      BookRating(
                        count: bookModel.volumeInfo!.ratingsCount ?? 0,
                        rating: bookModel.volumeInfo!.averageRating ?? 0,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
