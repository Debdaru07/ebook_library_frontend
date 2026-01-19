import 'package:flutter/material.dart';
import 'routes.dart';
import '../core/theme/app_theme.dart';

class BookLibraryApp extends StatelessWidget {
  const BookLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
