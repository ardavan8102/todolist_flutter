import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/widgets/buttons/floating_button.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class CategoryManagementPage extends StatelessWidget {
  const CategoryManagementPage({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CategoryProvider>();

    var size = MediaQuery.of(context).size;

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppSolidColors.primary,
        title: Text('دسته بندی ها', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: ExtendedFloatingButton(
        text: 'دسته جدید',
        icon: Icons.add,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
      
              // management list
              SectionTitle(title: 'مدیریت دسته ها'),
      
              const SizedBox(height: 15),
      
              SizedBox(
                width: size.width,
                height: size.height * .6,
                child: ListView.builder(
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    
                    final category = provider.categories[index];
                
                    return Container(
                      width: size.width,
                      height: size.height * .08,
                      margin: index != provider.categories.length - 1
                        ? const EdgeInsets.only(bottom: 20)
                        : .zero,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: .2),
                        borderRadius: .circular(15),
                        border: Border.all(width: 1, color: category.color)
                      ),
                      child: Row(
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .spaceBetween,
                        children: [
      
                          // icon
                          Container(
                            height: size.height * .05,
                            width: size.height * .05,
                            decoration: BoxDecoration(
                              color: category.color,
                              borderRadius: .circular(10)
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
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  category.title,
                                  style: textTheme.labelSmall!.copyWith(
                                    fontWeight: .bold,
                                    color: category.color
                                  ),
                                ),
                            
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Icon(
                                    Icons.edit_document,
                                    color: category.color,
                                    size: 24,
                                  ),
                                )
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