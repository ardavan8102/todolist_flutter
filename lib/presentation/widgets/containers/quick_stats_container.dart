import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/data/provider/stats_provider.dart';
import 'package:tikino/presentation/widgets/cards/quick_stats_card.dart';

class QuickStatsContainer extends StatelessWidget {
  const QuickStatsContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<StatsProvider>();

    var size = MediaQuery.of(context).size;
    
    return Container(
      height: size.height * .3,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: AppSolidColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Expanded(
                child: QuickStatsCardItem(
                  bgColor: Colors.green,
                  label: 'انجام شده',
                  value: provider.totalStats.totalCompleted.toString(),
                ),
              ),

              Expanded(
                child: QuickStatsCardItem(
                  bgColor: Colors.blueAccent,
                  label: 'درحال انجام',
                  value: provider.activeTodosCount.toString(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          QuickStatsCardItem(
            bgColor: Colors.red.shade900,
            label: 'کارهــای حذف شده',
            value: provider.totalStats.totalDeleted.toString(),
          ),
        ],
      ),
    );
  }
}