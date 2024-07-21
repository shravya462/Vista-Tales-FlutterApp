// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogListModelAdapter extends TypeAdapter<BlogListModel> {
  @override
  final int typeId = 0;

  @override
  BlogListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogListModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.place)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
