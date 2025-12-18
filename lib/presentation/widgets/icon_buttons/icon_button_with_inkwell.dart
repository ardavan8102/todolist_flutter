import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/presentation/widgets/todo_dialog.dart';

class IconButtonWithInkWell extends StatelessWidget {
  const IconButtonWithInkWell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppSolidColors.whiteBackground,
      borderRadius: .circular(10),
      child: InkWell(
        borderRadius: .circular(10),
        onTap: () => showDialog(context: context, builder: (_) => AddTodoDialog()),
        splashColor: AppSolidColors.primary.withValues(alpha: .4),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            border: Border.all(
              width: 1,
              color: AppSolidColors.lightBorder,
            ),
          ),
          child: Icon(
            CupertinoIcons.add,
            size: 32,
          ),
        ),
      ),
    );
  }
}