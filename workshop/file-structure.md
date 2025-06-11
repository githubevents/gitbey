# GitBey Project File Structure

## Config Layer
````markdown
lib/config/
├── api_config.dart (existing)
├── api_tokens.dart (secured, gitignored)
└── environment.dart (new)
````

## Services Layer
````markdown
lib/services/
├── playlist_generator/
│   ├── playlist_generator_service.dart
│   ├── playlist_generator_interface.dart
│   └── models/
│       ├── playlist_response.dart
│       └── playlist_request.dart
├── sentiment/
│   ├── sentiment_analyzer.dart
│   ├── sentiment_interface.dart
│   └── models/
│       ├── sentiment_result.dart
│       └── mood_categories.dart
└── github/
    ├── github_service.dart
    └── models/
        └── commit_data.dart
````

## Models Layer
````markdown
lib/models/
├── playlist.dart
├── song.dart
└── commit.dart
````

## Repository Layer
````markdown
lib/repositories/
├── playlist_repository.dart
└── github_repository.dart
````

## Utils Layer
````markdown
lib/utils/
├── connectivity_checker.dart
├── error_handler.dart
└── logger.dart
````

## Tests
````markdown
test/
├── services/
│   ├── playlist_generator_test.dart
│   └── sentiment_analyzer_test.dart
├── models/
│   └── playlist_test.dart
└── utils/
    └── connectivity_checker_test.dart
````

