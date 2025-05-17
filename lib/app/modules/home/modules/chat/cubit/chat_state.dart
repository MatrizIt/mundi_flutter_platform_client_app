import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:match/match.dart';

import '../../../../../models/chats.dart';

part 'chat_state.g.dart';

@match
enum ChatStatus { init, success, error }

@match
enum MessageStatus { init, sending, success, error }

class ChatState extends Equatable {
  final Chat? chat;
  final String? errorMessage;
  final ChatStatus status;
  final MessageStatus messageStatus;

  const ChatState(
      {required this.chat,
      this.errorMessage,
      required this.status,
      required this.messageStatus});

  const ChatState.initial()
      : chat = null,
        status = ChatStatus.init,
        messageStatus = MessageStatus.init,
        errorMessage = null;

  @override
  List<Object?> get props => [chat, errorMessage];

  ChatState copyWith(
      {Chat? chat,
      String? errorMessage,
      ChatStatus? status,
      MessageStatus? messageStatus}) {
    return ChatState(
        chat: chat ?? this.chat,
        status: status ?? this.status,
        messageStatus: messageStatus ?? this.messageStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
