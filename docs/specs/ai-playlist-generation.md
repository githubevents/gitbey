# Feature Spec: AI Playlist Generation

## Objective

Generate Beyoncé song recommendations based on commit sentiment.

## Steps

1. Integrate with an AI model (e.g., OpenAI, GitHub Models API) for song selection.
2. Design prompt templates for the AI (provide mood and context).
3. Send request to AI API and parse response (list of 5 songs).
4. UI: Display recommended songs with mood context.

## Pseudocode

- Given mood label:
  - Create prompt for AI
  - Send to AI API
  - Parse response for 5 songs
- Display songs in UI

## User Intervention

- Provide AI API key in `.env` if required.
