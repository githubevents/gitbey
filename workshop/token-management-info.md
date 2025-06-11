# Token Management in GitBey

The app uses a two-file approach for managing API tokens securely:

1. **Public Configuration** (api_config.dart):
```markdown
- Contains non-sensitive configuration
- References tokens through getters
- Includes API endpoints and model settings
- Safe to commit to version control
```

2. **Secure Tokens** (`api_tokens.dart`):
```markdown
- Contains sensitive credentials
- Gitignored to prevent accidental commits
- Holds actual token values
- Should be kept secure and not shared
```

## Implementation Structure

Here's how the token management is set up:

````dart
// This file should be gitignored
class ApiTokens {
  static const String githubModelsToken = 'your-github-models-token';
  static const String spotifyClientId = 'your-spotify-client-id';
  static const String spotifyClientSecret = 'your-spotify-client-secret';
  static const String spotifyRedirectUri = 'your-spotify-redirect-uri';
}
````

## Best Practices Used

1. **Separation of Concerns**
   - Configuration logic separated from sensitive data
   - Clean interface through getter methods
   - Easy to modify tokens without changing app logic

2. **Security Measures**
   ```markdown
   - .gitignore includes api_tokens.dart
   - No hardcoded tokens in version control
   - Tokens accessed through static getters
   ```

3. **Development Flow**
   ```markdown
   1. Developer copies api_tokens_example.dart to api_tokens.dart
   2. Fills in real tokens locally
   3. .gitignore prevents committing real tokens
   ```

