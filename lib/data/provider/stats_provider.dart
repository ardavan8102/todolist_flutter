import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tikino/data/model/for_providers/statuses.dart';
import 'package:tikino/data/model/for_providers/todo.dart';

class StatsProvider extends ChangeNotifier {
  final Box<TodoStats> statsBox = Hive.box<TodoStats>('stats');
  final Box<Todo> todosBox = Hive.box<Todo>('todos');

  TodoStats get totalStats => statsBox.get('global')!;

  int get activeTodosCount =>
      todosBox.values.where((todo) => !todo.isDone).length;

  int get totalTasksCount =>
      totalStats.totalCompleted +
      totalStats.totalDeleted +
      activeTodosCount;

  StatsProvider() {
    todosBox.listenable().addListener(_onHiveChanged);
    statsBox.listenable().addListener(_onHiveChanged);
  }

  void _onHiveChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    todosBox.listenable().removeListener(_onHiveChanged);
    statsBox.listenable().removeListener(_onHiveChanged);
    super.dispose();
  }
}