import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tikino/data/model/for_providers/todo.dart';

class StatsProvider extends ChangeNotifier {
  final Box<Todo> todosBox = Hive.box<Todo>('todos');

  int get activeTodosCount =>
      todosBox.values.where((todo) => !todo.isDone).length;
  

  int get completedTodosCount =>
      todosBox.values.where((todo) => todo.isDone).length;


  int get deletedTodosCount =>
      todosBox.values.where((todo) => todo.isDeleted).length;

  int get totalTasksCount =>
      completedTodosCount +
      deletedTodosCount +
      activeTodosCount;

  StatsProvider() {
    todosBox.listenable().addListener(_onHiveChanged);
  }

  void _onHiveChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    todosBox.listenable().removeListener(_onHiveChanged);
    super.dispose();
  }
}