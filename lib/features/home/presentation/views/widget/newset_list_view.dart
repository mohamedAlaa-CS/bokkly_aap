import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indacator_widget.dart';
import 'package:bookly/features/home/presentation/manager/newset_books/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newset_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NewestListViewItem(
                      bookModel: state.books[index],
                    ),
                  ),
                );
              });
        } else if (state is NewsetBooksFailure) {
          CustomErrorWidget(error: state.errorMessage);
        }
        return const CustomLoadingIndecator();
      },
    );
  }
}
