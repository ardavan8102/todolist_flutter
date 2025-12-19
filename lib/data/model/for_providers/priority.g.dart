// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoPriorityAdapter extends TypeAdapter<TodoPriority> {
  @override
  final int typeId = 1;

  @override
  TodoPriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoPriority.low;
      case 1:
        return TodoPriority.medium;
      case 2:
        return TodoPriority.high;
      default:
        return TodoPriority.low;
    }
  }

  @override
  void write(BinaryWriter writer, TodoPriority obj) {
    switch (obj) {
      case TodoPriority.low:
        writer.writeByte(0);
        break;
      case TodoPriority.medium:
        writer.writeByte(1);
        break;
      case TodoPriority.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoPriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
