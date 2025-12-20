import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tikino/data/model/for_providers/category.dart';
import 'package:uuid/uuid.dart';

void loadCategories() async {

  final box = Hive.box<CategoryModel>('categories');

  if (box.isEmpty) {
    await box.putAll({
      const Uuid().v4(): CategoryModel(
        id: const Uuid().v4(),
        title: 'کار یا پروژه',
        iconCodePoint: CupertinoIcons.briefcase.codePoint,
        colorValue: Colors.orange.toARGB32(),
      ),
      const Uuid().v4(): CategoryModel(
        id: const Uuid().v4(),
        title: 'درس خوندن',
        iconCodePoint: CupertinoIcons.book.codePoint,
        colorValue: Colors.blue.toARGB32(),
      ),
      const Uuid().v4(): CategoryModel(
        id: const Uuid().v4(),
        title: 'سرگرمی',
        iconCodePoint: CupertinoIcons.game_controller.codePoint,
        colorValue: Colors.red.toARGB32(),
      ),
    });
  }

}