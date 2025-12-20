import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/views/category_management/add_new_category.dart';
import 'package:tikino/presentation/views/category_management/edit_category_page.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';
import 'package:tikino/presentation/widgets/buttons/floating_button.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class CategoryManagementPage extends StatelessWidget {
  const CategoryManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryProvider>();

    //final size = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithActionButtons(
        bgColor: AppSolidColors.primary,
        title: 'دسته بندی ها',
        actions: const [],
      ),

      floatingActionButton: ExtendedFloatingButton(
        text: 'دسته جدید',
        icon: Icons.add,
        function: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AddNewCategoryPage())
          );
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'مدیریت دسته ها'),
              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {

                    final category = provider.categories[index];

                    return Container(
                      margin: index != provider.categories.length - 1
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: .15),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: category.color,
                        ),
                      ),
                      child: Row(
                        children: [
                          // icon box
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: category.color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              category.icon,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  category.title,
                                  style: textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: category.color,
                                  ),
                                ),

                                // manage button
                                PopupMenuButton<_CategoryMenuAction>(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: category.color,
                                  ),
                                  onSelected: (value) {
                                    switch (value) {
                                      case _CategoryMenuAction.edit:
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EditCategoryPage(
                                              selectedCategory: category,
                                            ),
                                          ),
                                        );
                                        break;

                                      case _CategoryMenuAction.delete:
                                        _showDeleteDialog(context, category, provider);
                                        break;
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: _CategoryMenuAction.edit,
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit, size: 18),
                                          SizedBox(width: 8),
                                          Text('ویرایش'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: _CategoryMenuAction.delete,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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

enum _CategoryMenuAction {
  edit,
  delete,
}