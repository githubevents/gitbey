// File: main.dart
// Purpose: Entry point for the GitBey app, allowing users to input their GitHub handle.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'github_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  print('Initializing app...');
  await dotenv.load(); // Load environment variables
  print('GITHUB_PERSONAL_ACCESS_TOKEN: ${dotenv.env['GITHUB_PERSONAL_ACCESS_TOKEN']}'); // Debug log for token
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building MyApp widget...');
    return MaterialApp(
      title: 'GitBey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GitHubHandleInputPage(),
    );
  }
}

class GitHubHandleInputPage extends StatefulWidget {
  const GitHubHandleInputPage({super.key});

  @override
  State<GitHubHandleInputPage> createState() => _GitHubHandleInputPageState();
}

class _GitHubHandleInputPageState extends State<GitHubHandleInputPage> {
  final TextEditingController _githubHandleController = TextEditingController();
  final GitHubService _gitHubService = GitHubService(dotenv.env['GITHUB_PERSONAL_ACCESS_TOKEN'] ?? ''); // Use environment variable for token
  bool _isValid = true;
  List<String> _commitMessages = [];
  String? _error;
  Map<String, int> _sentimentScores = {}; // Update type to match analyzeSentiment output

  void _validateInput() {
    print('Validating input: ${_githubHandleController.text}');
    setState(() {
      _isValid = _githubHandleController.text.isNotEmpty;
    });
  }

  Future<void> _fetchCommits() async {
    print('Fetching commits for handle: ${_githubHandleController.text}');
    setState(() {
      _error = null;
    });

    try {
      final commits = await _gitHubService.fetchCommitMessages(_githubHandleController.text);
      print('Fetched commits: $commits');

      final sentimentScores = _gitHubService.analyzeSentiment(commits);
      print('Sentiment analysis: $sentimentScores');

      setState(() {
        _commitMessages = commits;
        _sentimentScores = sentimentScores; // Add sentiment scores to state
      });
    } catch (e) {
      print('Error fetching commits: $e');
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Building GitHubHandleInputPage widget...');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter GitHub Handle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _githubHandleController,
              decoration: InputDecoration(
                labelText: 'GitHub Handle',
                errorText: _isValid ? null : 'Invalid handle',
              ),
              onChanged: (value) => _validateInput(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isValid ? _fetchCommits : null,
              child: const Text('Submit'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 20),
              Text(
                'Error: $_error',
                style: const TextStyle(color: Colors.red),
              ),
            ],
            if (_commitMessages.isNotEmpty) ...[
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _commitMessages.length,
                  itemBuilder: (context, index) {
                    print('Displaying commit message: ${_commitMessages[index]}');
                    return ListTile(
                      title: Text(_commitMessages[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text('Sentiment Analysis Results:'),
              Text('Happy: ${_sentimentScores['happy']}'),
              Text('Frustrated: ${_sentimentScores['frustrated']}'),
              Text('Productive: ${_sentimentScores['productive']}'),
            ],
          ],
        ),
      ),
    );
  }
}
