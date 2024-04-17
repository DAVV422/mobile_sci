import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static late final String apiKey;
  static late final String apiUrl;

  static Future<void> load() async {
    await dotenv.load();
    apiUrl = dotenv.env['API_URL'] ?? '';
  }
}