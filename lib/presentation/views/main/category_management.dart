import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/views/category_management/add_new_category.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';
import 'package:tikino/presentation/widgets/buttons/floating_button.dart';
import 'package:tikino/presentation/widgets/list_views/categories_list.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class CategoryManagementPage extends StatelessWidget {
  const CategoryManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryProvider>();

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
          child: provider.categories.isNotEmpty
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'مدیریت دسته ها'),
              const SizedBox(height: 15),

              // Categories List
              Expanded(
                child: CategoriesManagementListView(provider: provider, textTheme: textTheme),
              ),
            ],
          ) : Center(child: Text('دسته ای وجود ندارد', style: textTheme.labelLarge)),
        ),
      ),
    );
  }
}