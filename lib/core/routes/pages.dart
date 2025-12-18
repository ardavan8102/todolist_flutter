import 'package:flutter/material.dart';
import 'package:tikino/presentation/views/category_management.dart';
import 'package:tikino/presentation/views/homepage_screen.dart';
import 'package:tikino/presentation/views/stats_page.dart';
import 'package:tikino/presentation/views/tasks_list.dart';

class AppPages {

  static List<Widget> appScreens() {

    return [

      const HomepageScreen(),

      const TasksListPage(),

      const SizedBox.shrink(),

      const StatsPage(),

      const CategoryManagementPage(),

    ];

  }

}