import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/search/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
  };
}
