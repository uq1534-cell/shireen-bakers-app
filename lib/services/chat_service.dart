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

    // Add user message to history
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
          'systemInstruction': {
            'parts': [
              {
                'text': '''You are a friendly assistant for Shireen Bakers, 
a bakery in Rawalpindi, Pakistan. Help customers with products like 
cakes, pastries, bread, donuts, biscuits, and ice cream. 
Answer pricing questions in PKR. Keep replies short and friendly. 
Greet in Urdu when appropriate.'''
              }
            ]
          },
          'contents': _history.map((msg) {
            return {'role': msg['role'], 'parts': msg['parts']};
          }).toList(),
          'generationConfig': {
            'temperature': 0.7,
            'topK': 40,
            'topP': 0.95,
            'maxOutputTokens': 256,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['candidates'] != null &&
            data['candidates'].isNotEmpty &&
            data['candidates'][0]['content'] != null &&
            data['candidates'][0]['content']['parts'] != null &&
            data['candidates'][0]['content']['parts'].isNotEmpty) {
          final reply = data['candidates'][0]['content']['parts'][0]['text'];

          // Add assistant response to history
          _history.add({
            'role': 'model',
            'parts': [
              {'text': reply}
            ]
          });

          return reply;
        } else {
          return 'Sorry, I could not process that. Please try again.';
        }
      } else {
        // Log actual error for debugging
        return 'Error: Could not reach the service. Status ${response.statusCode}';
      }
    } catch (e) {
      return 'Something went wrong: ${e.toString()}';
    }
  }

  static void clearHistory() => _history.clear();
}
