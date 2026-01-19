import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'data/datasources/local/book_status_hive_service.dart';
import 'data/datasources/remote/open_library_api.dart';
import 'data/models/hive_book_status_model.dart';
import 'data/repositories/book_repository.dart';
import 'providers/book_provider.dart';
import 'providers/search_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveBookStatusModelAdapter());

  final bookStatusService = BookStatusHiveService();
  await bookStatusService.init();

  final openLibraryApi = OpenLibraryApi();

  final bookRepository = BookRepository(openLibraryApi, bookStatusService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider(bookRepository)),
        ChangeNotifierProvider(create: (_) => SearchProvider(bookRepository)),
      ],
      child: const BookLibraryApp(),
    ),
  );
}
