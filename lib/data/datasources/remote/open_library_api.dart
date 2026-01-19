import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/book_model.dart';
import '../../../core/constants/api_constants.dart';

class OpenLibraryApi {
  final http.Client _client = http.Client();

  Future<List<BookModel>> fetchAlreadyReadBooks() async {
    final response = await _client.get(
      Uri.parse(ApiConstants.alreadyReadBooksUrl),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch books');
    }

    final decoded = json.decode(response.body);
    final List works = decoded['reading_log_entries'] ?? [];

    return works.take(20).map((item) {
      return BookModel.fromJson(item['work']);
    }).toList();
  }

  Future<List<BookModel>> searchBooks(String query) async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.searchBaseUrl}?q=$query'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to search books');
    }

    final decoded = json.decode(response.body);
    final List docs = decoded['docs'] ?? [];

    return docs.map((item) {
      return BookModel.fromJson(item);
    }).toList();
  }
}
