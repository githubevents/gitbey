# Feature Specification: Commit Data Analysis

## Objective
Fetch the last 50 commits and analyze their sentiment.

---

## Functional Requirements

### 1. Fetch Commit Data
**Objective**: Retrieve the last 50 commits from the user's GitHub account.

**Steps**:
1. Use the GitHub API to fetch public events for the entered handle.
2. Filter the events to extract commit messages from `PushEvent` types.
3. Handle errors such as invalid handles, rate limits, and network issues.

**Pseudocode**:
```dart
final response = await http.get(
  Uri.parse('https://api.github.com/users/$handle/events/public?per_page=100'),
  headers: {'Authorization': 'Bearer $token'},
);
if (response.statusCode == 200) {
  final commits = parseCommits(response.body);
} else {
  throw Exception('Failed to fetch commits: ${response.statusCode}');
}
```

---

### 2. Perform Sentiment Analysis
**Objective**: Analyze the sentiment of the fetched commit messages to determine the "vibe."

**Steps**:
1. Preprocess commit messages (e.g., remove special characters, normalize text).
2. Use a sentiment analysis library or API to classify the mood of each message.
3. Aggregate the results to determine an overall vibe.

**Pseudocode**:
```dart
List<Sentiment> analyzeSentiments(List<String> messages) {
  return messages.map((message) => sentimentAnalyzer.analyze(message)).toList();
}
```

---

## Non-Functional Requirements

1. **Performance**: Ensure the app fetches and processes commit data within 5 seconds.
2. **Error Handling**: Provide user-friendly error messages for invalid inputs or API issues.

---

## User Intervention
1. Users must provide a valid GitHub handle.

---

This specification outlines the steps and requirements for implementing the commit data analysis feature in GitBey.
