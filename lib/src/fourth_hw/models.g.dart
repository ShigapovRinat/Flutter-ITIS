// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      user: fields[0] as User,
      postedAt: fields[1] as String,
      likedBy: (fields[2] as List).cast<User>(),
      images: (fields[3] as List).cast<String>(),
      assetImages: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.postedAt)
      ..writeByte(2)
      ..write(obj.likedBy)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.assetImages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PostContainerAdapter extends TypeAdapter<PostContainer> {
  @override
  final int typeId = 3;

  @override
  PostContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostContainer(
      posts: (fields[0] as List).cast<Post>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostContainer obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostContainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
