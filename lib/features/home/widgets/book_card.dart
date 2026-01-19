import 'dart:developer' as console;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/book_model.dart';
import '../../../providers/book_provider.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({super.key, required this.book});

  Widget buildCover(int? coverId) {
    return SizedBox(
      width: 48,
      height: 72,
      child:
          coverId == null
              ? const Icon(Icons.menu_book, color: Colors.grey)
              : Image.network(
                'https://covers.openlibrary.org/b/id/$coverId-M.jpg',
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) =>
                        const Icon(Icons.broken_image, color: Colors.grey),
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    final isRead = provider.isBookRead(book.id);
    console.log(
      'book :- ${book.title} , ${book.author} , ${book.coverId} , ${book.id} , ${book.publishedYear}',
    );
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
      ),
      child: Row(
        children: [
          // Book cover
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: buildCover(book.coverId),
          ),
          const SizedBox(width: 12),

          // Book info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${book.author} • ${book.publishedYear ?? '—'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Toggle (IMPORTANT)
          Switch(
            value: isRead,
            onChanged:
                (_) => context.read<BookProvider>().toggleReadStatus(book.id),
          ),
        ],
      ),
    );
  }
}
