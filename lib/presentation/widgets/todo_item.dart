import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/todo.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/icon_buttons/check_box_task_done.dart';
import 'package:tikino/presentation/widgets/icon_buttons/delete_task.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {

  Todo todo;
  int index;

  TodoItem({super.key, required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<Todoprovider>(context, listen: false);
    final color = Color(todo.colorValue);

    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 10),
        tileColor: color.withValues(alpha: .2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        leading: IsTaskDoneCheckBoxButton(
          color: color,
          todo: todo,
          provider: provider,
          index: index,
        ),
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: todo.isDone ? color.withValues(alpha: .5) : color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: DeleteTaskIconButton(
          provider: provider,
          index: index,
          color: color,
        ),
      ),
    );
  }
}
