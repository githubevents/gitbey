// File: github_service.dart
// Purpose: Provides functionality to fetch commit data from GitHub and analyze sentiment.

import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubService {
  final String apiUrl = 'https://api.github.com';
  final String token;

  GitHubService(this.token);

  // Fetches the last 50 commits for a given GitHub username
  Future<List<String>> fetchCommitMessages(String username) async {
    final url = '$apiUrl/users/$username/events/public?per_page=100';
    final response = await http.get(
      Uri.parse(url),
      // headers: {'Authorization': 'Bearer $token'},
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> events = jsonDecode(response.body);

      // Use expand to flatten the list of commit messages
      final commitMessages = events
          .where((event) => event['type'] == 'PushEvent')
          .expand((event) => (event['payload']['commits'] as List<dynamic>)
              .map((commit) => commit['message'] as String))
          .toList();

      return commitMessages;
    } else {
      throw Exception('Failed to fetch commits: ${response.statusCode}');
    }
  }

  // Analyzes the sentiment of commit messages
  Map<String, int> analyzeSentiment(List<String> messages) {
    final Map<String, int> sentimentScores = {
      'happy': 0,
      'frustrated': 0,
      'productive': 0,
    };

    for (var message in messages) {
      if (message.contains('fix') || message.contains('resolve')) {
        sentimentScores['productive'] = sentimentScores['productive']! + 1;
      } else if (message.contains('bug') || message.contains('issue')) {
        sentimentScores['frustrated'] = sentimentScores['frustrated']! + 1;
      } else {
        sentimentScores['happy'] = sentimentScores['happy']! + 1;
      }
    }

    return sentimentScores;
  }
}