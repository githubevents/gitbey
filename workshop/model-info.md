# GitHub Models Integration in GitBey

GitHub Models is being used in this project as an AI service to analyze commit messages and generate Beyoncé playlist recommendations. Here's a breakdown:

## Configuration Setup
````dart
class ApiConfig {
  static String get githubToken => ApiTokens.githubModelsToken;
  static const String githubModelsEndpoint = "https://models.github.ai/inference";
  static const String aiModel = "openai/gpt-4.1";
}
````

## How It Works

1. **Authentication**
   - The app uses a secure token stored in `ApiTokens` (gitignored)
   - This token authenticates requests to GitHub Models API

2. **API Integration**
   - Endpoint: `https://models.github.ai/inference`
   - Model: `openai/gpt-4.1`
   - Used for natural language processing of commit messages

3. **Workflow**
   ```mermaid
   graph LR
   A[Fetch Commits] --> B[Format Prompt]
   B --> C[Call GitHub Models API]
   C --> D[Process Response]
   D --> E[Generate Playlist]
   ```

4. **Example Usage in PlaylistGenerator**
````dart
class PlaylistGenerator {
  final String endpoint = ApiConfig.githubModelsEndpoint;
  final String token = ApiConfig.githubToken;

  Future<Map<String, dynamic>> analyzeCommits(List<String> commits) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': ApiConfig.aiModel,
        'prompt': _formatCommitsPrompt(commits),
        'temperature': 0.7,
      }),
    );
    
    return jsonDecode(response.body);
  }
}
````

## Benefits

1. **Natural Language Understanding**
   - Understands commit message context
   - Detects mood and sentiment
   - Maps development activity to music

2. **Intelligent Playlist Generation**
   - Creates contextual song recommendations
   - Provides reasoning for each song choice
   - Adapts to different coding activities

3. **Fallback Support**
   - Local sentiment analysis as backup
   - Continues working when API is unavailable
   - Maintains core functionality offline

