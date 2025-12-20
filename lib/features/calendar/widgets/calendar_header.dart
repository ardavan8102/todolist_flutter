import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/features/calendar/calendar_provider.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CalendarProvider>();
    
    final date = provider.selectedDate;

    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsGeometry.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: provider.prevoiusMonth,
            child: const Icon(
              Icons.chevron_left,
            ),
          ),

          Text(
            '${date.formatter.mN} ${date.year}',
            style: textTheme.labelLarge,
          ),

          GestureDetector(
            onTap: provider.nextMonth,
            child: const Icon(
              Icons.chevron_right,
            ),
          ),
        ],
      ),
    );
  }
}