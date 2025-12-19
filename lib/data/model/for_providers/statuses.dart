import 'package:hive/hive.dart';

part 'statuses.g.dart';

@HiveType(typeId: 5)
class TodoStats extends HiveObject {
  @HiveField(0)
  int totalCompleted;

  @HiveField(1)
  int totalDeleted;

  TodoStats({
    this.totalCompleted = 0,
    this.totalDeleted = 0,
  });
}