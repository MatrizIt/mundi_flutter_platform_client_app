class Message {
  String message;
  int reciverId;
  int senderId;

  Message(
      {required this.message, required this.reciverId, required this.senderId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        message: json['message'],
        reciverId: json['reciverId'],
        senderId: json['senderId']);
  }
}
