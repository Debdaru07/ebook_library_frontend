import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home Library',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Welcome back, Reader',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                // Profile icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.account_circle_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: UIConstants.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeSearchBar(),
            const SizedBox(height: UIConstants.spacing),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'My Collection',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.left,
              ),
            ),
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
