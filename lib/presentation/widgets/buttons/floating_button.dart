import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';

class ExtendedFloatingButton extends StatelessWidget {
  const ExtendedFloatingButton({
    super.key, required this.text, required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: AppSolidColors.accent.withValues(alpha: .2),
      elevation: 0,
      icon: Icon(icon, color: AppSolidColors.accent),
      label: Text(text, style: TextStyle(color: AppSolidColors.accent)),
    );
  }
}