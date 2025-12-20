import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/features/calendar/calendar_provider.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CalendarProvider>();
    final Jalali date = provider.selectedDate;
    final dayInMonth = date.monthLength;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: dayInMonth,
      itemBuilder: (context, index) {
        
        final day = index + 1;
        final currentDay = Jalali(date.year, date.month, day);

        final isSelected =
          currentDay.year == date.year &&
          currentDay.month == date.month &&
          currentDay.day == date.day;

        return GestureDetector(
          onTap: () => provider.selectDate(currentDay),
          child: Container(
            alignment: .center,
            decoration: BoxDecoration(
              color: isSelected ? AppSolidColors.primary : Colors.grey.shade300,
              borderRadius: .circular(8)
            ),
            child: Text(
              '$day',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey
              ),
            ),
          ),
        );

      },
    );
  }

  bool isSameDay(Jalali a, Jalali b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}