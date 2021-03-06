import 'package:flutter/material.dart';

import 'src/first_homework.dart';

void main() {
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
  List<String> items = ['homework #1'];

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
    }
  }
}
