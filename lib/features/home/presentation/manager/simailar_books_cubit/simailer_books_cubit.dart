import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'simailer_books_state.dart';

class SimailerBooksCubit extends Cubit<SimailerBooksState> {
  SimailerBooksCubit(this.homeRepo) : super(SimailerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBook({required String category}) async {
    emit(SimailerBooksLoading());
    var result = await homeRepo.fetchSimilarBook(category: category);
    result.fold((failure) {
      emit(SimailerBooksFailuer(failure.errorMessage));
    }, (books) {
      emit(SimailerBooksSuccess(books));
    });
  }
}
