import 'chat.dart';

class ChatState {
  final List<Chat> chat;

  ChatState({
    required this.chat,
  });

  factory ChatState.initial() => ChatState(
    chat: const [],
  );
} 