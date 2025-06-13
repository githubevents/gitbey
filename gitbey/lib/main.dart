// File: main.dart
// Purpose: Entry point for the GitBey app, allowing users to input their GitHub handle.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  bool _isValid = true;

  void _validateInput() {
    setState(() {
      _isValid = _githubHandleController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _isValid ? () {} : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
