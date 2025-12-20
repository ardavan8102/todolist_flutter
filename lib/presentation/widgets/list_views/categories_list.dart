import 'package:flutter/material.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/widgets/buttons/category_menu_action_button.dart';

class CategoriesManagementListView extends StatelessWidget {
  const CategoriesManagementListView({
    super.key,
    required this.provider,
    required this.textTheme,
  });

  final CategoryProvider provider;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    CategoryMenuActionButton(
                      category: category,
                      provider: provider,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}