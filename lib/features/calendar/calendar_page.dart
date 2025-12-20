import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/features/calendar/calendar_provider.dart';
import 'package:tikino/features/calendar/widgets/calendar_details.dart';
import 'package:tikino/features/calendar/widgets/calendar_grid.dart';
import 'package:tikino/features/calendar/widgets/calendar_header.dart';
import 'package:tikino/presentation/widgets/appbars/appbar_with_actions.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarProvider(),
      child: Scaffold(
        appBar: AppBarWithActionButtons(
          title: 'تقویـم',
          actions: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
          ],
          bgColor: AppSolidColors.primary
        ),
        body: Column(
          children: [
            CalendarHeader(),
            CalendarGrid(),
            CalendarDetails(),
          ],
        ),
      ),
    );
  }
}