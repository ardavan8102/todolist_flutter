import 'package:flutter/material.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('Tasks')
      )
    );
  }
}