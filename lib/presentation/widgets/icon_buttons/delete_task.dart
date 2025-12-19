import 'package:flutter/material.dart';
import 'package:tikino/data/provider/todo_provider.dart';

class DeleteTaskIconButton extends StatelessWidget {
  const DeleteTaskIconButton({
    super.key,
    required this.provider,
    required this.index,
    required this.color,
  });

  final Todoprovider provider;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => provider.deleteTodo(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(
          Icons.delete,
          color: color,
        ),
      ),
    );
  }
}