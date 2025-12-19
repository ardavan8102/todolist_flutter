import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  String title;
  IconData icon;
  Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
}