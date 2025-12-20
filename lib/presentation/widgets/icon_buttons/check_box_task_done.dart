import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/for_providers/todo.dart';
import 'package:tikino/data/provider/todo_provider.dart';

class IsTaskDoneCheckBoxButton extends StatelessWidget {
  final Todo todo;
  final Color color;

  const IsTaskDoneCheckBoxButton({
    super.key,
    required this.todo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<Todoprovider>();

    return Checkbox(
      value: todo.isDone,
      activeColor: color,
      onChanged: (_) {
        provider.toggleTodo(todo);
      },
    );
  }
}