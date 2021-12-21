import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hw/src/fourth_hw/fourth_homework.dart';
import 'package:flutter_hw/src/fourth_hw/models.dart';
import 'package:flutter_hw/src/second_hw/second_homework.dart';
import 'package:flutter_hw/src/third_hw/third_homework.dart';
import 'package:hive/hive.dart';
import 'src/first_homework.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(PostAdapter())
    ..registerAdapter(UserAdapter())
    ..registerAdapter(PostContainerAdapter());
  await Hive.openBox<PostContainer>('posts');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Homeworks'),
        initialRoute: '/',
        routes: {
          FirstHomework.routeName: (context) => const FirstHomework(),
          SecondHomework.routeName: (context) => const SecondHomework(),
          ThirdHomework.routeName: (context) => const ThirdHomework(),
          FourthHomework.routeName: (context) => const FourthHomework(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> items = ['homework #1', 'homework #2', 'homework #3', 'homework #4'];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: items.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              _navigateToHomework(item);
            },
          );
        }).toList(),
      )),
    );
  }

  void _navigateToHomework(item) {
    switch (item) {
      case "homework #1":
        Navigator.pushNamed(context, FirstHomework.routeName);
        break;
      case "homework #2":
        Navigator.pushNamed(context, SecondHomework.routeName);
        break;
      case "homework #3":
        Navigator.pushNamed(context, ThirdHomework.routeName);
        break;
      case "homework #4":
        Navigator.pushNamed(context, FourthHomework.routeName);
        break;
    }
  }
}
