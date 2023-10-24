import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: AspectRatio(
        aspectRatio: 1.3 / 2.1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(AssetsData.testImage),
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
