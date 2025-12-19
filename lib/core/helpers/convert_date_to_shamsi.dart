import 'package:shamsi_date/shamsi_date.dart';

String formatJalali(DateTime date) {
  final g = Gregorian.fromDateTime(date);
  final j = g.toJalali();

  return '${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
}