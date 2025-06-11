# Breaking Down GitBey Components into Focused Prompts

## 1. API Configuration Setup

```markdown
I need help creating a secure configuration system for my Flutter app that handles multiple API integrations. 

Requirements:
- Separate sensitive credentials from public config
- Support GitHub Models API integration
- Support Spotify API integration
- Include model settings
- Follow Flutter best practices for config management

Please create the configuration files with proper documentation.
```

## 2. GitHub Models Integration

```markdown
I need to implement the GitHub Models API integration for sentiment analysis.

Requirements:
- Create a service class for API communication
- Handle authentication with GitHub Models API
- Process commit messages into AI-friendly prompts
- Support retry mechanisms
- Return structured playlist data
- Include error handling
- Add proper logging

The response should match this format:
```json
{
  "mood": "string",
  "songs": [{
    "title": "string",
    "reasoning": "string"
  }]
}
```

## 3. Fallback Sentiment Analyzer

```markdown
I need a local sentiment analyzer as a fallback system when the AI service is unavailable.

Requirements:
- Create a lightweight sentiment detection system
- Define mood categories relevant to Beyoncé's discography
- Map commit keywords to moods
- Create a curated song list for each mood
- Ensure fast response times
- Include unit tests
- Add documentation for the sentiment rules
```

## 4. State Management and UI Integration

```markdown
I need help integrating the playlist generation system into the Flutter UI.

Requirements:
- Handle loading states
- Show error messages
- Display playlist results
- Support offline mode
- Add retry functionality
- Include pull-to-refresh
- Add animations for state transitions
```

## 5. Error Handling and Network Management

```markdown
I need comprehensive error handling for the API integration.

Requirements:
- Handle network timeouts
- Manage API rate limits
- Support offline detection
- Add retry mechanisms
- Show user-friendly error messages
- Include logging for debugging
- Support graceful degradation to local analysis
```
