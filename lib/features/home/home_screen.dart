import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/book_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/widgets/error_view.dart';
import '../../core/constants/ui_constants.dart';
import 'widgets/book_card.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<BookProvider>().fetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Library')),
      body: Padding(
        padding: UIConstants.screenPadding,
        child: Column(
          children: [
            const HomeSearchBar(),
            const SizedBox(height: UIConstants.spacing),
            Expanded(
              child: Consumer<BookProvider>(
                builder: (_, provider, __) {
                  if (provider.isLoading) {
                    return const LoadingIndicator();
                  }

                  if (provider.error != null) {
                    return ErrorView(message: provider.error!);
                  }

                  return ListView.separated(
                    itemCount: provider.books.length,
                    separatorBuilder:
                        (_, __) => const SizedBox(height: UIConstants.spacing),
                    itemBuilder: (_, index) {
                      final book = provider.books[index];
                      return BookCard(book: book);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
