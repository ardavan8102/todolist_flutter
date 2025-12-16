import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purple_do/model/todo.dart';
import 'package:purple_do/provider/todo_provider.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  Todo todo;
  int index;
  TodoItem({super.key, required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Todoprovider>(context, listen: false);
    return Card(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 24),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.deepPurple,
          value: todo.isDone,
          onChanged: (_) => provider.toggleTodoStatus(index),
        ),
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
              color: todo.isDone ? Colors.grey : Colors.black,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () => provider.deleteTodo(index),
          icon: Icon(Icons.delete),
          color: Colors.white,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red)
          ),
        ),
      ),
    );
  }
}