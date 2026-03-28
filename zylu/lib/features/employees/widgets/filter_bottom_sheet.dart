import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onSelect;

  const FilterBottomSheet({
    super.key,
    required this.selectedFilter,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF3B5EDF);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Icon(Icons.tune),
              SizedBox(width: 8),
              Text(
                "Filter Employees",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _item(context, "All", "all", primary),
          _item(context, "Active", "active", primary),
          _item(context, "Inactive", "inactive", primary),
          _item(context, "> 5 Years", "5years", Colors.green),
          _item(context, "> 2 Years", "2years", Colors.orange),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, String value, Color color) {
    final isSelected = selectedFilter == value;

    return GestureDetector(
      onTap: () {
        onSelect(value);
        Navigator.pop(context);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).unfocus();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: isSelected ? color : Colors.grey,
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isSelected ? color : Colors.black87,
                ),
              ),
            ),

            if (isSelected) Icon(Icons.check, size: 18, color: color),
          ],
        ),
      ),
    );
  }
}
