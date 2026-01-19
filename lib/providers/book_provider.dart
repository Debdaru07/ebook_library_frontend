import 'package:flutter/material.dart';
import '../data/models/book_model.dart';
import '../data/repositories/book_repository.dart';

class BookProvider extends ChangeNotifier {
  final BookRepository repository;

  BookProvider(this.repository);

  List<BookModel> books = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchBooks() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      books = await repository.fetchBooks();
    } catch (e) {
      error = 'Failed to load books';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isBookRead(String bookId) {
    return repository.isBookRead(bookId);
  }

  Future<void> toggleReadStatus(String bookId) async {
    await repository.toggleReadStatus(bookId);
    notifyListeners();
  }
}
