import 'package:flutter/material.dart';
import 'package:tikino/presentation/widgets/icon_buttons/icon_button_with_inkwell.dart';
import 'package:tikino/presentation/widgets/textfields/app_bar_search_field.dart';

class AppBarWithSearchBarAndAddButton extends StatelessWidget {
  const AppBarWithSearchBarAndAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: .spaceBetween,
      children: [
        // Search field
        Expanded(
          flex: 4,
          child: AppBarSearchTextField()
        ),
    
        // Add Task's Icon
        Expanded(
          flex: 1,
          child: IconButtonWithInkWell(
            function: () {
              
            },
            icon: Icons.menu,
          ),
        ),
      ],
    );
  }
}