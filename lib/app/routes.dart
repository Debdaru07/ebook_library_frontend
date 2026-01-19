import 'package:flutter/material.dart';
import '../features/root/root_screen.dart';
import '../features/search/search_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const RootScreen(),
    search: (_) => const SearchScreen(),
  };
}
