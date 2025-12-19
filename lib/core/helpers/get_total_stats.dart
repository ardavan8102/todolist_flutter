import 'package:hive/hive.dart';
import 'package:tikino/data/model/statuses.dart';
import 'package:tikino/data/model/todo.dart';

// get total (permanent) data
TodoStats get totalTaskStats => Hive.box<TodoStats>('stats').get('global')!;


// get now unfinished tasks
int get activeTodosCount {
  return Hive.box<Todo>('todos')
      .values
      .where((todo) => !todo.isDone)
      .length;
}


// total tasks
int totalTasksCount = totalTaskStats.totalDeleted + totalTaskStats.totalCompleted + activeTodosCount;