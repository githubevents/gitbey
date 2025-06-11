import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ai_playlist_service.dart';
import 'github_service.dart';
import 'sentiment_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _commitsResult = '';
  String _moodResult = '';
  String _playlistResult = '';
  final TextEditingController _controller = TextEditingController();
  final GitHubService _gitHubService = GitHubService();
  final SentimentService _sentimentService = SentimentService();
  final AIPlaylistService _aiPlaylistService = AIPlaylistService();
  List<String> _commitMessages = [];

  Future<void> _fetchCommits() async {
    final username = _controller.text.trim();
    if (username.isEmpty) return;
    setState(() {
      _commitsResult = 'Loading...';
      _moodResult = '';
      _playlistResult = '';
    });
    try {
      final commits = await _gitHubService.fetchRecentCommits(username);
      _commitMessages = commits.map((c) => c['message']?.toString() ?? '').toList();
      final mood = _sentimentService.analyzeMood(_commitMessages);
      setState(() {
        _commitsResult =
            'Found \\${commits.length} commits. Example message: \\${commits.isNotEmpty ? commits[0]['message'] : 'None'}';
        _moodResult = 'Overall coding mood: \\${mood}';
      });
      await _fetchPlaylist(mood);
    } catch (e) {
      setState(() {
        _commitsResult = 'Error: \\${e.toString()}';
        _moodResult = '';
        _playlistResult = '';
      });
    }
  }

  Future<void> _fetchPlaylist(String mood) async {
    setState(() {
      _playlistResult = 'Getting Beyoncé playlist...';
    });
    try {
      final songs = await _aiPlaylistService.getBeyonceSongs(mood);
      setState(() {
        _playlistResult = 'Recommended Beyoncé songs:';
        if (songs.isNotEmpty) {
          _playlistResult += '\\n' + songs.map((s) => '• $s').join('\\n');
        } else {
          _playlistResult += '\\n(No songs found)';
        }
      });
    } catch (e) {
      setState(() {
        _playlistResult = 'Error: \\${e.toString()}';
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181028), // Deep acai/black
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.2,
              colors: [
                Color(0xFF7B2FF2), // Acai purple
                Color(0xFF181028), // Black
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7B2FF2),
                blurRadius: 30,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                'Jc101',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Color(0xFF7B2FF2),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2D184A).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7B2FF2).withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Enter GitHub username to get your Beyoncé playlist:',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF181028),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        labelText: 'GitHub Username',
                        labelStyle: const TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF7B2FF2)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF7B2FF2), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B2FF2),
                        foregroundColor: Colors.white,
                        shadowColor: const Color(0xFF7B2FF2),
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onPressed: _fetchCommits,
                      child: const Text('Fetch Commits & Get Playlist'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              if (_commitsResult.isNotEmpty)
                Text(_commitsResult, style: const TextStyle(color: Colors.white, fontSize: 16)),
              if (_moodResult.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(_moodResult, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFB388FF), fontSize: 18, shadows: [Shadow(color: Color(0xFF7B2FF2), blurRadius: 8)])),
              ],
              if (_playlistResult.isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D184A).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7B2FF2).withOpacity(0.2),
                        blurRadius: 16,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(_playlistResult, style: const TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w600, fontSize: 17)),
                ),
              ],
              const SizedBox(height: 40),
              // ...existing code for counter or other widgets if needed...
            ],
          ),
        ),
      ),
      // ...existing code for floatingActionButton if needed...
    );
  }
}
