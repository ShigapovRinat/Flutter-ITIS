import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'api_client.dart';
import 'chat.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  RestClient restClient = RestClient(Dio());

  @observable
  ObservableList<Chat> chat = ObservableList.of([]);

  @action
  void fetchChat() {
    restClient.getChat().then((List<Chat> chatList) async{
      chat.clear();
      chat.addAll(chatList);
    }).catchError((error) {
      print(error.toString());
    });
  }

  @action
  void sendMessage(String textMessage, {Function? onSend}) {
    final String _author = 'Rinat';
    Chat message = Chat(author: _author, message: textMessage);

    restClient.sendMessage(message).then((Chat message) {
      chat.add(message);

      if (onSend != null) {
        onSend();
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}