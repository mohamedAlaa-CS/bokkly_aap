import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(),
              )),
    );
  }
}
