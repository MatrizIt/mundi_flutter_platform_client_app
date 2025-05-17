import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mundi_flutter_platform_client_app/app/models/chats.dart';

import '../../../../../models/messages.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());

  Future<void> initChannel(
      {required int entrepreneurId,
      required int userId,
      ScrollController? scrollController}) async {
    try {
      FirebaseFirestore.instance
          //.collection("/chats/$entrepreneurId-$userId/messages")
          .collection("/chats/$entrepreneurId-$userId/messages")
          .orderBy("createdAt", descending: false)
          .snapshots(includeMetadataChanges: true)
          .listen((chats) {
        if (!isClosed) {
          emit(state.copyWith(status: ChatStatus.init));
          final newChats = chats.docs.map((doc) {
            return Message.fromJson(doc.data());
          }).toList();

          emit(state.copyWith(
              chat: Chat(
                isActive: true,
                  entrepreneurId: entrepreneurId,
                  userId: userId,
                  messages: [Message(message: 'Mock', reciverId: 2, senderId: 1),Message(message: 'Mock 2', reciverId: 1, senderId: 2)]),
              status: ChatStatus.success));
          if (scrollController != null) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage(
      {required int entrepreneurId,
      required int userId,
      required TextEditingController message}) async {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc("$entrepreneurId-$userId")
          .collection('messages')
          .add({
        "reciverId": entrepreneurId,
        "senderId": userId,
        "message": message.text,
        "createdAt": DateTime.now()
      });

      message.text = "";
    } catch (e) {
      print(e);
    }
  }
}
