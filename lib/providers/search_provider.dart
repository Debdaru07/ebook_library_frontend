import 'package:flutter/material.dart';
import '../data/models/book_model.dart';
import '../data/repositories/book_repository.dart';
import '../utils/debounce.dart';

class SearchProvider extends ChangeNotifier {
  final BookRepository repository;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  SearchProvider(this.repository);

  List<BookModel> results = [];
  bool isLoading = false;

  void onQueryChanged(String query) {
    if (query.isEmpty) {
      results = [];
      notifyListeners();
      return;
    }

    _debouncer.run(() async {
      isLoading = true;
      notifyListeners();

      results = await repository.searchBooks(query);
      isLoading = false;
      notifyListeners();
    });
  }
}
