import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/for_providers/priority.dart';
import 'package:tikino/data/model/for_providers/todo.dart';
import 'package:tikino/data/model/stats/stats_period.dart';
import 'package:tikino/data/model/stats/stats_result.dart';
import 'package:tikino/data/provider/stats_provider.dart';

class Todoprovider extends ChangeNotifier {

  // Create a DB box
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  // Get All Todo list items from DB box
  List<Todo> get todos => _todoBox.values.toList();


  List<Todo> get undoneTodoList =>
    todos
        .where((t) => !t.isDone && !t.isDeleted)
        .toList();

  List<Todo> get doneTodoList =>
      todos
          .where((t) => t.isDone && !t.isDeleted)
          .toList();

  List<Todo> get deletedTodoList =>
      todos.where((t) => t.isDeleted).toList();


  // Stats provider for updating them
  final stats = StatsProvider();

  // Add Todo list Item functionallity
  void addTodo({
    required String title,
    required int colorValue,
    required TodoPriority priority,
    required DateTime? dueDate,
    List<String>? categories,
  }){
    final todo = Todo(
      title: title,
      colorValue: colorValue,
      priority: priority,
      dueDate: dueDate,
      categories: categories,
    );
    _todoBox.add(todo);
    notifyListeners();
  }

  // Change Item Status functionallity
  void toggleTodo(Todo todo) {
    
    todo.isDone = !todo.isDone;

    todo.save();

    notifyListeners();
  }

  // Remove Todo list Item functionallity
  void deleteTodo(Todo todo) async {

    todo.isDeleted = true;

    todo.save();
    
    notifyListeners();
  }


  // Get stats real-time
  StatsResult getStatsByPeriod(StatsPeriod period) {
    final now = DateTime.now();
    late DateTime startDate;

    switch (period) {
      case StatsPeriod.daily:
        startDate = DateTime(now.year, now.month, now.day);
        break;

      case StatsPeriod.weekly:
        final monday = now.subtract(Duration(days: now.weekday - 1));
        startDate = DateTime(monday.year, monday.month, monday.day);
        break;

      case StatsPeriod.monthly:
        startDate = DateTime(now.year, now.month, 1);
        break;
    }

    final filteredTodos = todos.where((todo) =>
        todo.createdAt.isAfter(startDate) ||
        todo.createdAt.isAtSameMomentAs(startDate)).toList();

    final completed =
        filteredTodos.where((t) => t.isDone && !t.isDeleted).length;

    final deleted =
        filteredTodos.where((t) => t.isDeleted).length;

    final active =
        filteredTodos.where((t) => !t.isDone && !t.isDeleted).length;

    return StatsResult(
      total: filteredTodos.length,
      completed: completed,
      deleted: deleted,
      active: active,
    );
  }

}