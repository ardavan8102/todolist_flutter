import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:tikino/data/model/for_providers/todo.dart';
import 'package:tikino/data/provider/category_provider.dart';
import 'package:tikino/presentation/widgets/icon_buttons/check_box_task_done.dart';
import 'package:tikino/presentation/widgets/icon_buttons/delete_task.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {

    final categoryProvider = context.watch<CategoryProvider>();

    CategoryModel? category;

    if (todo.categories.isNotEmpty) {
      for ( final c in categoryProvider.categories ) {
        if (c.id == todo.categories.first) {
          category = c;
          break;
        }
      }
    }

    final color = Color(todo.colorValue);

    return Card(
      key: ValueKey(todo.key), 
      margin: const EdgeInsets.all(15),
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        tileColor: color.withValues(alpha: .2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: IsTaskDoneCheckBoxButton(
          todo: todo,
          color: color,
        ),
        title: Text(
          todo.title,
          textAlign: TextAlign.right,
          style: TextStyle(
            decoration:
                todo.isDone ? TextDecoration.lineThrough : null,
            color: todo.isDone
                ? color.withValues(alpha: .5)
                : color,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: category == null
          ? null
          : Text(category.title),
        trailing: DeleteTaskIconButton(
          todo: todo,
          color: color,
        ),
      ),
    );
  }
}