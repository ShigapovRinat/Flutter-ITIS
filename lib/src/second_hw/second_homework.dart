import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'chat_store.dart';
import 'chat_view.dart';

class SecondHomework extends StatefulWidget {
  const SecondHomework({Key? key}) : super(key: key);

  static const routeName = '/hw2';
  final String title = 'homework #2';

  @override
  _SecondHomeworkState createState() => _SecondHomeworkState();
}

class _SecondHomeworkState extends State<SecondHomework> {
  ChatStore _chatStore = ChatStore();

  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatStore.fetchChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: _chatStore.chat.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return ChatList(
                      name: _chatStore.chat[index].author,
                      message: _chatStore.chat[index].message,
                    );
                  },
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: "Your message",
                    hintText: "Your message",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _addMessage,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMessage() {
    setState(() {
      _chatStore.sendMessage(messageController.text,
          onSend: () => {messageController.clear()});
    });
  }
}