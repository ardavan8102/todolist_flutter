import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';

class IconButtonWithInkWell extends StatelessWidget {
  const IconButtonWithInkWell({
    super.key, required this.function, required this.icon,
  });

  final Function() function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppSolidColors.whiteBackground,
      borderRadius: .circular(10),
      child: InkWell(
        borderRadius: .circular(10),
        onTap: function,
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
            icon,
            size: 32,
          ),
        ),
      ),
    );
  }
}