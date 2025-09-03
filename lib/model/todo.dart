import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId:0)
class Todo extends HiveObject {
  
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false
  });

}