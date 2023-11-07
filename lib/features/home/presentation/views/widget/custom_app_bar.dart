import 'package:bookly/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 46, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logoImage,
            height: 19,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchView());
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass))
        ],
      ),
    );
  }
}
