import 'package:flutter/material.dart';
import 'package:tikino/data/lists/category_data.dart';

class CategoryColorsListView extends StatelessWidget {
  const CategoryColorsListView({super.key, this.selectedColor, required this.onSelect});

  final Color? selectedColor;
  final Function(Color) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: .horizontal,
      itemCount: categoryColors.length,
      itemBuilder: (context, index) {
        
        final color = categoryColors[index];
        final isSelected = color == selectedColor;

        return Padding(
          padding: index == categoryIcons.length -1
            ? .zero
            : const EdgeInsetsGeometry.only(left: 20),
          child: GestureDetector(
            onTap: () => onSelect(color),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: isSelected
                  ? selectedColor
                  : color.withValues(alpha: .3),
                borderRadius: .circular(12),
              ),
              child: isSelected
                ? Icon(
                  Icons.check,
                  color: Colors.white
                ) : const SizedBox.shrink()
            ),
          ),
        );

      },
    );
  }
}