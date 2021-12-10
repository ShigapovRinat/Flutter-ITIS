import 'chat_action.dart';
import 'chat_state.dart';

postsReducer(ChatState prevState, SetChatStateAction action) {
  final payload = action.chatState;
  return payload.chat;
} 