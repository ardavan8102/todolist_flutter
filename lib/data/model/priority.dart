import 'package:hive/hive.dart';

part 'priority.g.dart';

@HiveType(typeId: 1)
enum TodoPriority {
  @HiveField(0)
  low,

  @HiveField(1)
  medium,

  @HiveField(2)
  high,
}