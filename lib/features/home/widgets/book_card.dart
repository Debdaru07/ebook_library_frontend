import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/book_model.dart';
import '../../../providers/book_provider.dart';
import '../../../core/constants/api_constants.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookProvider>();
    final isRead = provider.isBookRead(book.id);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _BookCover(coverId: book.coverId),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${book.author} • ${book.publishedYear ?? 'N/A'}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        isRead
                            ? ElevatedButton(
                              onPressed:
                                  () => provider.toggleReadStatus(book.id),
                              child: const Text('Read'),
                            )
                            : OutlinedButton(
                              onPressed:
                                  () => provider.toggleReadStatus(book.id),
                              child: const Text('Unread'),
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  final int? coverId;

  const _BookCover({this.coverId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child:
          coverId != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  ApiConstants.coverImageUrl(coverId.toString()),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.book),
                ),
              )
              : const Icon(Icons.book),
    );
  }
}
