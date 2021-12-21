import 'package:flutter_hw/src/fourth_hw/models.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  final barcelona =
      const User(name: "barcelona", image: "resources/images/barcelona.png");
  final psg = const User(name: "psg", image: "resources/images/psg.png");

  late Box box;

  _PostsStore() {
    initiallizeHive();
    fetchPosts();
  }

  initiallizeHive() async {
    box = Hive.box<PostContainer>('posts');
  }

  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  @action
  void fetchPosts() {
    PostContainer? container = box.get('posts', defaultValue: null);
    if (container != null) {
      posts = ObservableList.of(container.posts);
    } else {
      final postsList = <Post>[
        Post(
          user: barcelona,
          images: [],
          assetImages: ["resources/images/barcelona.png"],
          likedBy: [psg],
          postedAt: "20 декабря 2021 г.",
        ),
        Post(
          user: psg,
          images: [],
          assetImages: [
            "resources/images/psg.png",
            "resources/images/player.jpg"
          ],
          likedBy: [barcelona],
          postedAt: "19 декабря 2021 г.",
        ),
      ];
      PostContainer postContainer = PostContainer(posts: postsList);
      box.put('posts', postContainer);
      fetchPosts();
    }
  }

  @action
  addPost(String filePath, String description) {
    Post newPost = Post(
      user: barcelona,
      images: [filePath],
      assetImages: [],
      likedBy: [],
      postedAt: "22 декабря 2021 г.",
    );
    posts.insert(0, newPost);
    PostContainer postContainer = PostContainer(posts: posts);
    box.put('posts', postContainer);
  }
}
