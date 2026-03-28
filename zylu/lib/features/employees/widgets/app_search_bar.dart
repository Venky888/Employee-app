import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final Color borderColor;

  const AppSearchBar({
    super.key,
    required this.onChanged,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Search employees...",
        prefixIcon: const Icon(Icons.search),

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(vertical: 14),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor.withValues(alpha: 0.25)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
      ),
    );
  }
}
class SearchFilterBar extends StatelessWidget {
  final Function(String) onSearch;
  final VoidCallback onFilterTap;
  final List<Color> gradientColors;
  final Color color;

  const SearchFilterBar({
    super.key,
    required this.onSearch,
    required this.onFilterTap,
    required this.gradientColors,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: AppSearchBar(onChanged: onSearch, borderColor: color),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradientColors),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
