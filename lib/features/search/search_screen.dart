import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/search_provider.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../core/constants/ui_constants.dart';
import '../home/widgets/book_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Books')),
      body: Padding(
        padding: UIConstants.screenPadding,
        child: Column(
          children: [
            _SearchInputField(onChanged: provider.onQueryChanged),
            const SizedBox(height: UIConstants.spacing),

            /// Content Area
            Expanded(child: _buildContent(provider)),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(SearchProvider provider) {
    if (provider.isLoading) {
      return const LoadingIndicator();
    }

    if (provider.results.isEmpty) {
      return const Center(
        child: Text(
          'Start typing to search books',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: provider.results.length,
      separatorBuilder: (_, __) => const SizedBox(height: UIConstants.spacing),
      itemBuilder: (_, index) {
        return BookCard(book: provider.results[index]);
      },
    );
  }
}

class _SearchInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const _SearchInputField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search by book title',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
