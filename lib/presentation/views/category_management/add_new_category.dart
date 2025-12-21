import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';
import 'package:tikino/presentation/widgets/buttons/full_width_update_button.dart';
import 'package:tikino/presentation/widgets/list_views/category_colors_list_view.dart';
import 'package:tikino/presentation/widgets/list_views/category_icon_picker_list.dart';
import 'package:tikino/presentation/widgets/textfields/add_todo/dialog_text_fields.dart';
import 'package:tikino/presentation/widgets/texts/section_title.dart';

class AddNewCategoryPage extends StatefulWidget {
  const AddNewCategoryPage({
    super.key,
  });

  @override
  State<AddNewCategoryPage> createState() => _AddNewCategoryPageState();
}

class _AddNewCategoryPageState extends State<AddNewCategoryPage> {

  final TextEditingController _titleEditingController = TextEditingController();

  int? selectedIndex;
  
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
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
        bgColor: selectedColor ?? AppSolidColors.primary,
        title: 'افزودن دسته جدید',
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
                hintText: 'عنوان دسته را وارد کنید',
                controller: _titleEditingController,
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: 'انتخاب آیکون'),
              const SizedBox(height: 12),

              SizedBox(
                height: size.height * .08,
                child: CategoryIconPicker(
                  selectedIndex: selectedIndex ?? 0,
                  selectedColor: selectedColor ?? AppSolidColors.primary,
                  onSelect: (index) {
                    setState(() {
                      selectedIndex = index;
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
                selectedColor: selectedColor ?? AppSolidColors.primary,
                function: () {
                  provider.addCategory(
                    _titleEditingController.text.trim(),
                    selectedIndex ?? 0,
                    selectedColor ?? AppSolidColors.primary
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