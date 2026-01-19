import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../../../app/routes.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.search),
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search by title, author...',
            hintStyle: TextStyle(fontSize: 14, color: const Color(0xFF656388)),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF4F44E9)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
