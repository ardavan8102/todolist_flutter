class StatsResult {
  final int total;
  final int completed;
  final int deleted;
  final int active;

  const StatsResult({
    required this.total,
    required this.completed,
    required this.deleted,
    required this.active,
  });
}