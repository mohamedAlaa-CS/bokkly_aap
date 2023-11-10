import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/search/presentation/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../home/presentation/views/widget/newset_list_view_item.dart';

class SearchView extends SearchDelegate {
  /* @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(appBarTheme: const AppBarTheme());
  }*/

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Center(
        child: IconButton(
          icon: const Icon(
            Icons.clear,
            size: 33,
          ),
          onPressed: () {
            query = '';
          },
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return NewestListViewItem(
            bookModel: state.book[0],
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(error: state.errorMessage);
        }
        return Center(
            child:
                Lottie.asset('assets/images/Animation - 1699475878861.json'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    BlocProvider.of<SearchCubit>(context).getSearchData(query: query);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: state.book.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NewestListViewItem(
                      bookModel: state.book[index],
                    ),
                  ),
                );
              });
        } else if (state is SearchFailure) {
          CustomErrorWidget(error: state.errorMessage);
        }
        return Center(
            child: Lottie.asset('assets/images/Animation - 1699476364073.json',
                width: 260));
      },
    );
  }
}
