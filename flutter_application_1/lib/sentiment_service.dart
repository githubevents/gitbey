class SentimentService {
  // Simple word lists for demonstration
  static const List<String> positiveWords = [
    'fix', 'add', 'improve', 'update', 'success', 'happy', 'clean', 'refactor', 'feature', 'love', 'great', 'awesome', 'win', 'pass', 'resolve', 'fast', 'optimize', 'enhance', 'good', 'better', 'best', 'yay', 'cool', 'enjoy', 'fun', 'smile'
  ];
  static const List<String> negativeWords = [
    'bug', 'fail', 'error', 'issue', 'break', 'broken', 'slow', 'remove', 'delete', 'problem', 'bad', 'worse', 'worst', 'hate', 'angry', 'frustrate', 'block', 'crash', 'fixme', 'todo', 'hack', 'struggle', 'pain', 'conflict', 'oops', 'mess'
  ];

  String analyzeMood(List<String> messages) {
    int score = 0;
    for (final msg in messages) {
      final lower = msg.toLowerCase();
      for (final word in positiveWords) {
        if (lower.contains(word)) score++;
      }
      for (final word in negativeWords) {
        if (lower.contains(word)) score--;
      }
    }
    if (score > 3) return 'Happy/Productive';
    if (score < -3) return 'Frustrated/Blocked';
    return 'Neutral/Mixed';
  }
}
