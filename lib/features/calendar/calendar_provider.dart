import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class CalendarProvider extends ChangeNotifier {

  late Jalali selectedDate;

  CalendarProvider(){
    selectedDate = Jalali.now();
  }

  void selectDate(Jalali date) {
    selectedDate = date;
    notifyListeners();
  }

  void nextMonth() {
    selectedDate = selectedDate.addMonths(1);
    notifyListeners();
  }

  void prevoiusMonth() {
    selectedDate = selectedDate.addMonths(-1);
    notifyListeners();
  }

}