// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  final _$chatAtom = Atom(name: '_ChatStore.chat');

  @override
  ObservableList<Chat> get chat {
    _$chatAtom.reportRead();
    return super.chat;
  }

  @override
  set chat(ObservableList<Chat> value) {
    _$chatAtom.reportWrite(value, super.chat, () {
      super.chat = value;
    });
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void fetchChat() {
    final _$actionInfo =
    _$_ChatStoreActionController.startAction(name: '_ChatStore.fetchChat');
    try {
      return super.fetchChat();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage(String textMessage, {Function? onSend}) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.sendMessage');
    try {
      return super.sendMessage(textMessage, onSend: onSend);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chat: ${chat}
    ''';
  }
}