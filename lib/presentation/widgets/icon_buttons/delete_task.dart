import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/for_providers/todo.dart';
import 'package:tikino/data/provider/todo_provider.dart';

class DeleteTaskIconButton extends StatelessWidget {
  final Todo todo;
  final Color color;

  const DeleteTaskIconButton({
    super.key,
    required this.todo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<Todoprovider>();

    return IconButton(
      icon: Icon(Icons.delete, color: color),
      onPressed: () {
        provider.deleteTodo(todo);
      },
    );
  }
}