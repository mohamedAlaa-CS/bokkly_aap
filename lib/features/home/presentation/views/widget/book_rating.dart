import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(rating.toString(), style: Styles.textStyle18),
        const SizedBox(width: 5),
        Text('($count)',
            style: Styles.textStyle16.copyWith(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.w600))
      ],
    );
  }
}
