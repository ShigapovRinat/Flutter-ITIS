import 'package:flutter/material.dart';
import 'package:flutter_hw/src/fourth_hw/post_widget.dart';
import 'package:flutter_hw/src/fourth_hw/posts_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;
  final PostsStore postsStore;

  const HomePage({required this.scrollController, required this.postsStore});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ListView.builder(
        itemBuilder: (ctx, i) {
          return PostWidget(widget.postsStore.posts[i]);
        },
        itemCount: widget.postsStore.posts.length,
        controller: widget.scrollController,
      ),
    );
  }
}
