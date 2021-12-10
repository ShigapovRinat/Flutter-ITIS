import 'package:flutter/material.dart';

class FirstHomework extends StatefulWidget {
  const FirstHomework({Key? key}) : super(key: key);

  static const routeName = '/hw1';
  final String title = 'homework #1';

  @override
  _FirstHomeworkState createState() => _FirstHomeworkState();
}

class _FirstHomeworkState extends State<FirstHomework> {
  List<String> messages = [];
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: messageController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: "Write message",
                    hintText: "Write message",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _addMessage,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMessage() {
    setState(() {
      messages.add(messageController.text);
      messageController.clear();
    });
  }
}
