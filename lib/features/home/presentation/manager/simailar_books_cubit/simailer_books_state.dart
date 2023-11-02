part of 'simailer_books_cubit.dart';

sealed class SimailerBooksState extends Equatable {
  const SimailerBooksState();

  @override
  List<Object> get props => [];
}

final class SimailerBooksInitial extends SimailerBooksState {}

final class SimailerBooksLoading extends SimailerBooksState {}

final class SimailerBooksFailuer extends SimailerBooksState {
  final String errorMessage;

  const SimailerBooksFailuer(this.errorMessage);
}

final class SimailerBooksSuccess extends SimailerBooksState {
  final List<BookModel> books;

  const SimailerBooksSuccess(this.books);
}
