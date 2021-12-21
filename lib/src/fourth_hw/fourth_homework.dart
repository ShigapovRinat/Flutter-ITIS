import 'package:flutter/material.dart';
import 'package:flutter_hw/src/fourth_hw/add_new_post_screen.dart';
import 'package:flutter_hw/src/fourth_hw/home_page.dart';
import 'package:flutter_hw/src/fourth_hw/posts_store.dart';

class FourthHomework extends StatefulWidget {
  const FourthHomework({Key? key}) : super(key: key);

  static const routeName = '/hw4';
  final String title = 'homework #4';

  @override
  _FourthHomeworkState createState() => _FourthHomeworkState();
}

class _FourthHomeworkState extends State<FourthHomework> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold();
  }
}

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final PostsStore postsStore = PostsStore();
  int _tabSelectedIndex = 0;
  late ScrollController _scrollController;

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  Widget _buildBody() {
    switch (_tabSelectedIndex) {
      default:
        _scrollController = ScrollController(initialScrollOffset: 0);
        return HomePage(
            scrollController: _scrollController, postsStore: postsStore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[50],
          title: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              GestureDetector(
                child: const Text(
                  'Instagram',
                  style: TextStyle(color: Colors.black, fontSize: 40.0),
                ),
                onTap: _scrollToTop,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
              child: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("resources/icons/add.png")),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AddNewPostScreen(postsStore: postsStore))),
            ),
            const SizedBox(width: 32.0),
            GestureDetector(
              child: Container(
                  width: 24,
                  height: 24,
                  child: const ImageIcon(
                      AssetImage("resources/icons/messenger.png"),
                      size: 24,
                      color: Colors.black))
            ),
            const SizedBox(width: 16.0)
          ],
        ),
        body: _buildBody());
  }
}
