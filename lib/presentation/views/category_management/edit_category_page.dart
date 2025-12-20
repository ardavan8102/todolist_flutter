import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';
import 'package:tikino/presentation/widgets/buttons/full_width_update_button.dart';
import 'package:tikino/presentation/widgets/list_views/category_colors_list_view.dart';
import 'package:tikino/presentation/widgets/list_views/category_icon_picker_list.dart';
import 'package:tikino/presentation/widgets/textfields/add_todo/dialog_text_fields.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({
    super.key,
    required this.selectedCategory,
  });

  final CategoryModel selectedCategory;

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {

  final TextEditingController _titleEditingController = TextEditingController();

  late IconData selectedIcon;

  late Color selectedColor;

  @override
  void initState() {
    super.initState();

    _titleEditingController.text = widget.selectedCategory.title;
    selectedIcon = widget.selectedCategory.icon;
    selectedColor = widget.selectedCategory.color;
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CategoryProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWithActionButtons(
        bgColor: selectedColor,
        title: 'ویرایش دسته',
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'نام دسته بندی'),
              const SizedBox(height: 12),

              AddTodoTextFieldCustom(
                hintText: widget.selectedCategory.title,
                controller: _titleEditingController,
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: 'انتخاب آیکون'),
              const SizedBox(height: 12),

              SizedBox(
                height: size.height * .08,
                child: CategoryIconPicker(
                  selectedIcon: selectedIcon,
                  selectedColor: selectedColor,
                  onSelect: (icon) {
                    setState(() {
                      selectedIcon = icon;
                    });
                  },
                ),
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: 'انتخاب رنگ'),
              const SizedBox(height: 12),

              SizedBox(
                height: size.height * .08,
                child: CategoryColorsListView(
                  selectedColor: selectedColor,
                  onSelect: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
              ),

              SizedBox(height: size.height * .1),

              FullWidthUpdateCategoryElevatedButton(
                selectedColor: selectedColor,
                function: () {
                  final category = widget.selectedCategory;

                  category.title = _titleEditingController.text.trim();
                  category.iconCodePoint = selectedIcon.codePoint;
                  category.colorValue = selectedColor.toARGB32();
                  

                  provider.updateCategory(
                    category
                  );

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}