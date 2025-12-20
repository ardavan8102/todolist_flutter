import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/category_provider.dart';
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
          // TODO: navigate to AddCategoryPage
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

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditCategoryPage(
                                          selectedCategory: category,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: category.color,
                                    size: 22,
                                  ),
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
}