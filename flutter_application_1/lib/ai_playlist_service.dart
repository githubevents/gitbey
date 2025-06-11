import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIPlaylistService {
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<List<String>> getBeyonceSongs(String mood) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null) throw Exception('Missing OpenAI API key');
    final prompt =
        'You are a music expert. Given the coding mood "$mood", recommend 5 Beyoncé songs that fit this mood. Only return a plain list of song titles.';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': prompt},
        ],
        'max_tokens': 100,
        'temperature': 0.7,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['choices'][0]['message']['content'] as String;
      final lines = text.split('\n').where((l) => l.trim().isNotEmpty).toList();
      // Remove numbering if present
      return lines.map((l) => l.replaceAll(RegExp(r'^\d+\.\s*'), '')).toList();
    } else {
      throw Exception('Failed to get playlist: ${response.body}');
    }
  }
}
