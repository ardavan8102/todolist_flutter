import 'package:shamsi_date/shamsi_date.dart';

extension JalaliFullFormatter on Jalali {
  String get fullPersianDate {
    final f = formatter;
    return '${f.wN} ${f.dd} ${f.mN} ${f.y}';
  }
}