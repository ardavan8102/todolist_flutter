import 'package:shamsi_date/shamsi_date.dart';

String getNowJalaliDate() {

  final now = Jalali.now();

  final day = now.formatter.d;
  final month = now.formatter.mN;
  final year = now.formatter.yyyy;

  final date = '$day $month $year' ;

  return date;
}