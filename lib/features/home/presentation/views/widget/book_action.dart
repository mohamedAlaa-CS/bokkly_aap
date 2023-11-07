import 'package:bookly/core/functions/url_luncher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.urlBook});
  final String urlBook;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundcolor: Colors.white,
            text: 'Free',
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          )),
          Expanded(
              child: CustomButton(
            onpressed: () {
              CustomlaunchUrl(url: urlBook);
            },
            backgroundcolor: const Color(0xffEF8262),
            text: 'Free Preview',
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ))
        ],
      ),
    );
  }
}
