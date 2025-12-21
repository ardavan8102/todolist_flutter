import 'package:flutter/material.dart';
import 'package:tikino/data/lists/category_data.dart';

class CategoryIconPicker extends StatelessWidget {
  const CategoryIconPicker({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
    required this.selectedColor,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryIcons.length,
      itemBuilder: (context, index) {
        final icon = categoryIcons[index];
        final isSelected = index == selectedIndex;

        return Padding(
          padding: index == categoryIcons.length - 1
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? selectedColor
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 26,
                color: isSelected
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ),
        );
      },
    );
  }
}