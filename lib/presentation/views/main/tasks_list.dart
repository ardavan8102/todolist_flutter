import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/tasks_list_view.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});
  

  @override
  Widget build(BuildContext context) {

    final todoProvider = Provider.of<Todoprovider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TasksListView(todoProvider: todoProvider)
        ),
      )
    );
  }
}