import 'package:flutter/material.dart';
import 'package:tikino/data/lists/category_data.dart';

class CategoryIconPicker extends StatelessWidget {
  const CategoryIconPicker({
    super.key,
    required this.selectedIcon,
    required this.onSelect,
    required this.selectedColor,
  });

  final IconData selectedIcon;
  final ValueChanged<IconData> onSelect;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryIcons.length,
      itemBuilder: (context, index) {
        final icon = categoryIcons[index];
        final isSelected = icon == selectedIcon;

        return Padding(
          padding: index == categoryIcons.length - 1
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => onSelect(icon),
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