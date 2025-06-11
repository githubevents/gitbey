import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GitHubService {
  final String baseUrl = 'https://api.github.com';

  Future<List<Map<String, dynamic>>> fetchRecentCommits(String username) async {
    final token = dotenv.env['GITHUB_TOKEN'];
    final url = Uri.parse(
      '$baseUrl/users/$username/events/public?per_page=100',
    );
    final response = await http.get(
      url,
      headers: token != null ? {'Authorization': 'token $token'} : {},
    );
    if (response.statusCode == 200) {
      final List events = json.decode(response.body);
      final commits = events
          .where((event) => event['type'] == 'PushEvent')
          .expand((event) => event['payload']['commits'] as List)
          .take(50)
          .map((commit) => commit as Map<String, dynamic>)
          .toList();
      return commits;
    } else {
      throw Exception('Failed to load commits: \\${response.statusCode}');
    }
  }
}
