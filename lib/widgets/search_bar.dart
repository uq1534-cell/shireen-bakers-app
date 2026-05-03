import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final ValueChanged<String>? onSearch;

  const AppSearchBar({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: 'Search for cakes, bread, or pastries',
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
