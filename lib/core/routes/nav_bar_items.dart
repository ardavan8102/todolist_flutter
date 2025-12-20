import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/presentation/views/main/category_management.dart';
import 'package:tikino/presentation/views/main/homepage_screen.dart';
import 'package:tikino/presentation/views/main/stats_page.dart';
import 'package:tikino/presentation/views/main/tasks_list.dart';
import 'package:tikino/presentation/widgets/todo_dialog.dart';

class AppNavBarPages {

  static List<PersistentBottomNavBarItem> navBarsItems() {
    return [
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            title: ("خــانه"),
            activeColorPrimary: AppSolidColors.accent,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/home",
                routes: {
                "/stats": (final context) => const StatsPage(),
                "/categories": (final context) => const CategoryManagementPage(),
                "/tasks": (final context) => const TasksListPage(),
                },
            ),
        ),

        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.doc_on_clipboard),
            title: ("کــارها"),
            activeColorPrimary: AppSolidColors.accent,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/tasks",
                routes: {
                "/home": (final context) => const HomepageScreen(),
                "/stats": (final context) => const StatsPage(),
                "/categories": (final context) => const CategoryManagementPage(),
                },
            ),
        ),

        PersistentBottomNavBarItem(
            iconSize: 32,
            icon: Icon(CupertinoIcons.add, color: Colors.white),
            title: ("کـار جدید"),
            activeColorPrimary: AppSolidColors.accent,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            onPressed: (context) => showDialog(context: context!, builder: (_) => AddTodoDialog()),
        ),

        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            title: ("آمــار"),
            activeColorPrimary: AppSolidColors.accent,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/stats",
                routes: {
                "/home": (final context) => const HomepageScreen(),
                "/categories": (final context) => const CategoryManagementPage(),
                "/tasks": (final context) => const TasksListPage(),
                },
            ),
        ),

        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.list_dash),
            title: ("دستـه هـا"),
            activeColorPrimary: AppSolidColors.accent,
            inactiveColorPrimary: CupertinoColors.systemGrey,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                initialRoute: "/categories",
                routes: {
                "/home": (final context) => const HomepageScreen(),
                "/stats": (final context) => const StatsPage(),
                "/tasks": (final context) => const TasksListPage(),
                },
            ),
        ),
    ];
  }

}