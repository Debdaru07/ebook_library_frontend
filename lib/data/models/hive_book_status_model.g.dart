// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_book_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBookStatusModelAdapter extends TypeAdapter<HiveBookStatusModel> {
  @override
  final int typeId = 1;

  @override
  HiveBookStatusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBookStatusModel(
      bookId: fields[0] as String,
      isRead: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBookStatusModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.isRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBookStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
