import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class Modality {
  final int id;
  final String title;
  final double duration;
  final double price;

  const Modality({
    required this.id,
    required this.duration,
    required this.price,
    required this.title,
  });

  String getPrice() {
    final currencyFormat = NumberFormat.simpleCurrency();
    return "R\$ ${currencyFormat.format(price).replaceAll("\$", "").replaceAll(".", ",")}";
  }

  int getDuration() {
    return duration ~/ 60;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'duration': duration,
      'price': price,
    };
  }

  factory Modality.fromMap(Map<String, dynamic> map) {
    return Modality(
      id: map['id'],
      title: map['title'] ?? '',
      duration: map['duration']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Modality.fromJson(String source) =>
      Modality.fromMap(json.decode(source));
}
