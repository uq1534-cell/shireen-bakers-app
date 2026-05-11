import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatService {
  static const _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  static final List<Map<String, dynamic>> _history = [];

  static Future<String> sendMessage(String userMessage) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      return 'Error: GEMINI_API_KEY not configured. Please check your .env file.';
    }

    _history.add({
      'role': 'user',
      'parts': [
        {'text': userMessage}
      ]
    });

    try {
      final response = await http.post(
        Uri.parse('$_url?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'system_instruction': {
            'parts': [
              {
                'text': '''You are a friendly assistant for Shireen Bakers,
                a bakery in Rawalpindi Pakistan. Help customers with
                products like cakes, pastries, bread, donuts, biscuits
                and ice cream. Answer pricing in PKR. Keep replies short
                and friendly. Greet in Urdu when appropriate.'''
              }
            ]
          },
          'contents': _history,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['candidates'][0]['content']['parts'][0]['text'];

        _history.add({
          'role': 'model',
          'parts': [
            {'text': reply}
          ]
        });

        return reply;
      } else {
        return 'Sorry, could not get a response. Please try again.';
      }
    } catch (e) {
      return 'Something went wrong. Please check your connection.';
    }
  }

  static void clearHistory() => _history.clear();
}
