import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PurpleDo/model/todo.dart';
import 'package:PurpleDo/provider/TodoProvider.dart';

class TodoItem extends StatelessWidget {
  Todo todo;
  int index;
  TodoItem({super.key, required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Todoprovider>(context, listen: false);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (_) => provider.toggleTodoStatus(index),
        ),
        title: Text(todo.title ?? ""),
        trailing: IconButton(
          onPressed: () => provider.deleteTodo(index),
          icon: Icon(Icons.delete),
          color: Colors.red[900],
        ),
      ),
    );
  }
}