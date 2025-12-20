import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/for_providers/priority.dart';
import 'package:tikino/data/model/for_providers/todo.dart';
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
  }){
    final todo = Todo(
      title: title,
      colorValue: colorValue,
      priority: priority,
      dueDate: dueDate,

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

}