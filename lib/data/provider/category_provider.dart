import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tikino/data/model/category_model.dart';
import 'package:uuid/uuid.dart';

class CategoryProvider extends ChangeNotifier {

  final List<CategoryModel> _categories = [

    CategoryModel(
      id: const Uuid().v4(),
      title: 'کار یا پروژه', 
      icon: CupertinoIcons.briefcase,
      color: Colors.orange
    ),

    CategoryModel(
      id: const Uuid().v4(),
      title: 'درس خوندن', 
      icon: CupertinoIcons.book,
      color: Colors.blue
    ),

    CategoryModel(
      id: const Uuid().v4(),
      title: 'سرگرمی', 
      icon: CupertinoIcons.briefcase,
      color: Colors.red
    ),

  ];


  List<CategoryModel> get categories => _categories;



  void addCategory(CategoryModel category){

    _categories.add(category);
    notifyListeners();

  }

  void updateCategory(String id, CategoryModel updated) {

    final index = _categories.indexWhere((category) => category.id == id);

    if (index != -1) {
      _categories[index] = updated;
      notifyListeners();
    }

  }

  void deleteCategory(String id) {

    _categories.removeWhere((category) => category.id == id);
    notifyListeners();

  }

}