import 'package:flutter/cupertino.dart';
import 'package:tikino/data/model/grid_category_model.dart';
import 'package:tikino/features/calendar/calendar_page.dart';

void homeGridNavigation(HomeGridItem item, BuildContext context){

  if (item.action == HomeGridAction.openCalender) {
                  
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => CalenderPage())
    );

  } else if (item.action == HomeGridAction.habitTracker) {

    // TODO : Open habit tracker

  } else if (item.action == HomeGridAction.openHomeWorkPage) {

    // TODO : Open homework page

  } else if (item.action == HomeGridAction.openOccasionPage) {

    // TODO : Open Occasions page

  } else {

    // TODO : Open countdowns oage

  }

}