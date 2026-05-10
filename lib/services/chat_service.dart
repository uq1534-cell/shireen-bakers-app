import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/chat_message.dart';

class ChatService {
  static const String _baseUrl = 'https://api.anthropic.com/v1/messages';
  static const String _modelId = 'claude-sonnet-4-20250514';
  static const int _maxTokens = 1024;
  static const String _anthropicVersion = '2023-06-01';

  static const String _systemPrompt =
      '''You are a friendly assistant for Shireen Bakers, a bakery in Rawalpindi Pakistan. Help customers with products (cakes, pastries, bread, donuts, biscuits, ice cream), pricing in PKR, store locations, delivery and custom cake orders. Keep replies short and friendly.''';

  final List<ChatMessage> _conversationHistory = [];
  late final String _apiKey;

  ChatService() {
    _apiKey = dotenv.env['CLAUDE_API_KEY'] ?? '';
  }

  Future<String> sendMessage(String userMessage) async {
    try {
      if (_apiKey.isEmpty) {
        return 'Error: CLAUDE_API_KEY not configured in .env file';
      }

      // Add user message to history
      _conversationHistory.add(
        ChatMessage(
          text: userMessage,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );

      // Build messages array for API
      final List<Map<String, String>> messages = _conversationHistory
          .map((msg) => {
                'role': msg.isUser ? 'user' : 'assistant',
                'content': msg.text,
              })
          .toList();

      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {
              'Content-Type': 'application/json',
              'x-api-key': _apiKey,
              'anthropic-version': _anthropicVersion,
            },
            body: jsonEncode({
              'model': _modelId,
              'max_tokens': _maxTokens,
              'system': _systemPrompt,
              'messages': messages,
            }),
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw Exception('Request timeout'),
          );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String assistantMessage =
            data['content'][0]['text'] ?? 'No response received';

        // Add assistant message to history
        _conversationHistory.add(
          ChatMessage(
            text: assistantMessage,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );

        return assistantMessage;
      } else {
        final String errorBody = response.body;
        return 'Error: ${response.statusCode} - $errorBody';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  List<ChatMessage> getConversationHistory() => _conversationHistory;

  void clearHistory() {
    _conversationHistory.clear();
  }
}
