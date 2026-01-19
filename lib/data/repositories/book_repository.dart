import '../datasources/remote/open_library_api.dart';
import '../datasources/local/book_status_hive_service.dart';
import '../models/book_model.dart';

class BookRepository {
  final OpenLibraryApi _api;
  final BookStatusHiveService _local;

  BookRepository(this._api, this._local);

  Future<List<BookModel>> fetchBooks() async {
    return await _api.fetchAlreadyReadBooks();
  }

  Future<List<BookModel>> searchBooks(String query) async {
    return await _api.searchBooks(query);
  }

  bool isBookRead(String bookId) {
    return _local.isBookRead(bookId);
  }

  Future<void> toggleReadStatus(String bookId) async {
    await _local.toggleBookStatus(bookId);
  }
}
