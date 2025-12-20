import 'package:flutter/material.dart';
import 'package:tikino/data/model/category_menu_actions.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/views/category_management/edit_category_page.dart';

class CategoryMenuActionButton extends StatelessWidget {
  const CategoryMenuActionButton({super.key, required this.provider, required this.category});

  final CategoryProvider provider;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CategoryMenuAction>(
      icon: Icon(
        Icons.more_vert,
        color: category.color,
      ),
      onSelected: (value) {
        switch (value) {
          case CategoryMenuAction.edit:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditCategoryPage(
                  selectedCategory: category,
                ),
              ),
            );
            break;

          case CategoryMenuAction.delete:
            _showDeleteDialog(context, category, provider);
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: CategoryMenuAction.edit,
          child: Row(
            children: [
              Icon(Icons.edit, size: 18),
              SizedBox(width: 8),
              Text('ویرایش'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: CategoryMenuAction.delete,
          child: Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'حذف',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, CategoryModel category, CategoryProvider provider) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('حذف دسته'),
        content: Text('آیا از حذف "${category.title}" مطمئنی؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('انصراف'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              provider.deleteCategory(category.id);
            },
            child: const Text(
              'حذف',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}