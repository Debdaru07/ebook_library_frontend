class ApiConstants {
  static const String alreadyReadBooksUrl =
      'https://openlibrary.org/people/mekBot/books/already-read.json';

  static const String searchBaseUrl = 'https://openlibrary.org/search.json';

  String coverUrl(int? coverId) {
    if (coverId == null) return '';
    return 'https://covers.openlibrary.org/b/id/$coverId-M.jpg';
  }
}
