import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indacator_widget.dart';
import 'package:bookly/features/home/presentation/manager/simailar_books_cubit/simailer_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimallerListview extends StatelessWidget {
  const SimallerListview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimailerBooksCubit, SimailerBooksState>(
      builder: (context, state) {
        if (state is SimailerBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomBookImage(
                          imageUrl: state.books[index].volumeInfo?.imageLinks
                                  ?.thumbnail ??
                              'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png'),
                    )),
          );
        } else if (state is SimailerBooksFailuer) {
          return CustomErrorWidget(error: state.errorMessage);
        }
        return const CustomLoadingIndecator();
      },
    );
  }
}
