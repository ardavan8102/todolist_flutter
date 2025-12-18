import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/todo.dart';

class Todoprovider extends ChangeNotifier {

  // Create a DB box
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  // Get All Todo list items from DB box
  List<Todo> get todos => _todoBox.values.toList();

  // Add Todo list Item functionallity
  void addTodo(String title){
    final todo = Todo(title: title);
    _todoBox.add(todo);
    notifyListeners();
  }

  // Change Item Status functionallity
  void toggleTodoStatus(int index){
    final todo = _todoBox.getAt(index);
    if (todo != null) {
      todo.isDone = !todo.isDone;
      todo.save();
      notifyListeners();
    }
  }

  // Remove Todo list Item functionallity
  void deleteTodo(int index){
    _todoBox.deleteAt(index);
    notifyListeners();
  }

}