import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:uuid/uuid.dart';

class CategoryProvider extends ChangeNotifier {
  final Box<CategoryModel> _box =
      Hive.box<CategoryModel>('categories');

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => List.unmodifiable(_categories);

  CategoryProvider() {
    _loadCategories();
  }

  void _loadCategories() {
    _categories = _box.values.toList();
    notifyListeners();
  }

  Future<void> addCategory(
    String title,
    int index,
    Color color,
  ) async {
    final category = CategoryModel(
      id: const Uuid().v4(),
      title: title,
      iconIndex: index,
      colorValue: color.toARGB32(),
    );

    await _box.put(category.id, category);
    _loadCategories();
  }

  Future<void> updateCategory(CategoryModel updated) async {
    await updated.save();
    _loadCategories();
  }

  Future<void> deleteCategory(String id) async {
    await _box.delete(id);
    _loadCategories();
  }
}