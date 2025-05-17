import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String? get(String param) {
    return dotenv.get(param);
  }

  static Future<void> load() async {
    await dotenv.load();
  }
}