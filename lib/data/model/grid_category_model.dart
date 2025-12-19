import 'package:flutter/material.dart';

class HomeGridItem {
  final String title;
  final Widget icon;
  final HomeGridAction action;

  HomeGridItem({
    required this.title,
    required this.icon,
    required this.action,
  });
}

enum HomeGridAction {
  openCalender,
  habitTracker,
  importantCountDowns,
  openOccasionPage,
  openHomeWorkPage,
}