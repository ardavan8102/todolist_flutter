import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 4)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int iconIndex;

  @HiveField(3)
  int colorValue;

  CategoryModel({
    required this.id,
    required this.title,
    required this.iconIndex,
    required this.colorValue,
  });


  Color get color => Color(colorValue);

}