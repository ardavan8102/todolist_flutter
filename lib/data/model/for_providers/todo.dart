import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/for_providers/priority.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {

  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  DateTime? dueDate;

  @HiveField(4)
  TodoPriority? priority;

  @HiveField(5)
  List<String> categories;

  @HiveField(6)
  int colorValue;

  @HiveField(7)
  int iconCodePoint;

  @HiveField(8)
  bool isDeleted;

  Todo({
    required this.title,
    this.isDone = false,
    this.isDeleted = false,
    DateTime? createdAt,
    this.dueDate,
    this.priority = TodoPriority.medium,
    List<String>? categories,
    this.colorValue = 0xFF7B61FF,
    int? iconCodePoint,
  })  : createdAt = createdAt ?? DateTime.now(),
        categories = categories ?? [],
        iconCodePoint = iconCodePoint ?? Icons.check_circle_outline.codePoint;



  IconData get icon => IconData(
        iconCodePoint,
        fontFamily: Icons.check_circle_outline.fontFamily,
        fontPackage: Icons.check_circle_outline.fontPackage,
      );
}