import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/book_provider.dart';
import '../home/widgets/book_card.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();

    final readBooks =
        provider.books.where((b) => provider.isBookRead(b.id)).toList();

    if (readBooks.isEmpty) {
      return const Center(
        child: Text(
          'No books marked as read',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: readBooks.length,
      itemBuilder: (_, i) => BookCard(book: readBooks[i]),
    );
  }
}
