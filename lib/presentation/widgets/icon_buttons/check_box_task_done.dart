import 'package:flutter/material.dart';
import 'package:tikino/data/model/todo.dart';
import 'package:tikino/data/provider/todo_provider.dart';

class IsTaskDoneCheckBoxButton extends StatelessWidget {
  const IsTaskDoneCheckBoxButton({
    super.key,
    required this.color,
    required this.todo,
    required this.provider,
    required this.index,
  });

  final Color color;
  final Todo todo;
  final Todoprovider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: color,
      value: todo.isDone,
      onChanged: (_) => provider.toggleTodoStatus(index),
    );
  }
}