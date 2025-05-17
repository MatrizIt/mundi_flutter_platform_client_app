import 'messages.dart';

class Chat {
  int entrepreneurId;
  int userId;
  List<Message>? messages;
  bool isActive;

  Chat(
      {required this.entrepreneurId,
      required this.userId,
      required this.isActive,
      this.messages});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        isActive: json['isActive'],
        entrepreneurId: json['entrepreneur'],
        userId: json['userId'],
        messages:
            json['messages']?.map((message) => Message.fromJson(message)) ??
                const []);
  }
}
