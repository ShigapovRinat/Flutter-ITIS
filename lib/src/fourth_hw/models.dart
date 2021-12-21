import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  User user;
  @HiveField(1)
  final String postedAt;
  @HiveField(2)
  List<User> likedBy;
  @HiveField(3)
  List<String> images;
  @HiveField(4)
  List<String> assetImages;

  Post({
    required this.user,
    required this.postedAt,
    required this.likedBy,
    required this.images,
    required this.assetImages,
  });
}

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;

  const User({
    required this.name,
    required this.image,
  });
}

@HiveType(typeId: 3)
class PostContainer {
  @HiveField(0)
  List<Post> posts;

  PostContainer({
    required this.posts,
  });
}
