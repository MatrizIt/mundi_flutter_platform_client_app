import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/chats.dart';

class FirebaseApi {
  List<Chat> chats = [];

  List<Chat>? getAllChats() {
    try {
      FirebaseFirestore.instance
          .collection("chats").where("id", isEqualTo: 1)
          .snapshots(includeMetadataChanges: true)
          .listen((chats) {
        this.chats = chats.docs.map((doc) {
          return Chat.fromJson(doc.data());
        }).toList();
      });

      return chats;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
