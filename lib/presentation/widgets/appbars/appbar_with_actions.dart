import 'package:flutter/material.dart';

class AppBarWithActionButtons extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithActionButtons({
    super.key,
    required this.title,
    required this.actions,
    required this.bgColor,
  });

  final String title;
  final List<Widget> actions;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(title, style: TextStyle(color: Colors.white)),
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(60);
}