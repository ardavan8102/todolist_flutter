import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/data/model/stats/stats_period.dart';
import 'package:tikino/data/model/stats/stats_result.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/presentation/widgets/cards/stat_card.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  StatsPeriod selectedPeriod = StatsPeriod.daily;

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<Todoprovider>();
    final stats = todoProvider.getStatsByPeriod(selectedPeriod);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildPeriodSelector(),
            const SizedBox(height: 24),
            _buildStatsGrid(stats),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'آمار فعالیت‌ها',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return SegmentedButton<StatsPeriod>(
      segments: const [
        ButtonSegment(
          value: StatsPeriod.daily,
          label: Text('روزانه'),
        ),
        ButtonSegment(
          value: StatsPeriod.weekly,
          label: Text('هفتگی'),
        ),
        ButtonSegment(
          value: StatsPeriod.monthly,
          label: Text('ماهانه'),
        ),
      ],
      selected: {selectedPeriod},
      onSelectionChanged: (value) {
        setState(() {
          selectedPeriod = value.first;
        });
      },
    );
  }

  Widget _buildStatsGrid(StatsResult stats) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      children: [
        StatCard(
          title: 'کل وظایف',
          value: stats.total,
          color: Colors.blue,
        ),
        StatCard(
          title: 'انجام شده',
          value: stats.completed,
          color: Colors.green,
        ),
        StatCard(
          title: 'در حال انجام',
          value: stats.active,
          color: Colors.orange,
        ),
        StatCard(
          title: 'حذف شده',
          value: stats.deleted,
          color: Colors.red,
        ),
      ],
    );
  }
}