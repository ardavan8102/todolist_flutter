import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/features/calendar/helpers/convert_prayer_time_to_hour_minute.dart';
import 'package:tikino/features/calendar/calendar_provider.dart';

class CalendarDetails extends StatelessWidget {
  const CalendarDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final date = context.watch<CalendarProvider>().selectedDate;

    final gregorian = date.toGregorian(); // --> Miladi

    final hijri = HijriCalendar.fromDate( // --> Qamari
      DateTime(
        gregorian.year,
        gregorian.month,
        gregorian.day
      ),
    );


    final coords = Coordinates(35.6892, 51.3890); // --> Tehran
    final params = CalculationMethod.tehran.getParameters();

    final prayerTimes = PrayerTimes(
      coords, 
      DateComponents.from(DateTime(
        gregorian.year,
        gregorian.month,
        gregorian.day
      )),
      params
    );

    return Padding(
      padding: const EdgeInsetsGeometry.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const Divider(),

          const SizedBox(height: 12),

          dateContainer(date, '🌍 میلادی: ${gregorian.day} / ${gregorian.month} / ${gregorian.year}', Colors.blueAccent),

          const SizedBox(height: 12),

          dateContainer(date, '🕌 قمری: ${hijri.hDay} / ${hijri.hMonth} / ${hijri.hYear}', Colors.orange),

          const SizedBox(height: 20),

          const Text('⏰  اوقات شرعی ایران', style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

          Row(
            spacing: 12,
            children: [
              prayerTimesContainer(prayerTimes, prayerTimes.fajr.hm, CupertinoIcons.sunrise_fill),

              prayerTimesContainer(prayerTimes, prayerTimes.dhuhr.hm, CupertinoIcons.sun_max_fill),

              prayerTimesContainer(prayerTimes, prayerTimes.maghrib.hm, CupertinoIcons.moon_stars_fill),
            ],
          ),
        ],
      ),
    );
  }

  Widget prayerTimesContainer(PrayerTimes prayerTimes, String time, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppSolidColors.accent.withValues(alpha: .1),
          border: Border.all(width: 1, color: AppSolidColors.accent.withValues(alpha: .7)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Icon(icon),
      
            const SizedBox(height: 12),
      
            Text(time),
          ],
        )
      ),
    );
  }

  Container dateContainer(Jalali date, String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        border: Border.all(width: 1, color: color.withValues(alpha: .6)),
        borderRadius: .circular(12)
      ),
      padding: const EdgeInsets.all(12),
      child: Text(text)
    );
  }
}