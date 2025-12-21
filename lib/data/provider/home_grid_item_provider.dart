import 'package:flutter/material.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/model/grid_category_model.dart';

class HomeGridProvider with ChangeNotifier {
  List<HomeGridItem> get items => [
        HomeGridItem(
          title: 'تقویــم',
          icon: Icon(Icons.calendar_today_sharp, color: AppSolidColors.whiteBackground, size: 30),
          action: HomeGridAction.openCalender,
        ),
        HomeGridItem(
          title: 'عـادت ها',
          icon: Icon(Icons.games, color: AppSolidColors.primary, size: 30),
          action: HomeGridAction.habitTracker,
        ),
        HomeGridItem(
          title: 'شمـارش ها',
          icon: Icon(Icons.numbers_sharp, color: AppSolidColors.primary, size: 30),
          action: HomeGridAction.importantCountDowns,
        ),
        HomeGridItem(
          title: 'مناسبت هـا',
          icon: Icon(Icons.announcement, color: AppSolidColors.primary, size: 30),
          action: HomeGridAction.openOccasionPage,
        ),
        HomeGridItem(
          title: 'مشق شب',
          icon: Icon(Icons.school, color: AppSolidColors.primary, size: 30),
          action: HomeGridAction.openHomeWorkPage,
        ),
      ];
}