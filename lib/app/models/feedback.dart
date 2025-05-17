class Feedback {
  final int? id;
  final String userName;
  final int? userId;
  final int? entrepreneurId;
  final int? scheduleId;
  final double rating;
  final String comment;

  const Feedback({
    this.id,
    required this.userName,
    required this.userId,
    required this.entrepreneurId,
    required this.scheduleId,
    required this.rating,
    required this.comment,
  });

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['id'],
      entrepreneurId: map['entrepreneurId'],
      userName: map['name'],
      userId: map['userId'],
      scheduleId: map['scheduleId'],
      rating: map['rating'],
      comment: map['comment'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': userName,
      'userId': userId,
      'entrepreneurId': entrepreneurId,
      'scheduleId': scheduleId,
      'rating': rating,
      'comment': comment,
    };
  }
}
