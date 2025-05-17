import 'dart:convert';

import 'modality.dart';

class Work {
  final String title;
  final String description;
  final List<Modality> modalities;

  const Work({
    required this.title,
    required this.modalities,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'modalities': modalities.map((x) => x.toMap()).toList(),
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      title: map['service'] ?? '',
      description: map['description'] ?? '',
      modalities: List<Modality>.from(
          map['modalities']?.map((x) => Modality.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) => Work.fromMap(json.decode(source));
}
