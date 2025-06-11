# Feature Spec: Sentiment Analysis of Commits

## Objective

Analyze commit messages to determine coding mood.

## Steps

1. Add a sentiment analysis package or implement a simple algorithm.
2. Preprocess commit messages (lowercase, remove punctuation, etc.).
3. For each commit, compute a sentiment score (positive/negative/neutral).
4. Aggregate scores to determine overall mood (e.g., happy, frustrated, productive).
5. UI: Display mood summary and example analysis.

## Pseudocode

- For each commit message:
  - Clean/preprocess text
  - Compute sentiment score
- Aggregate all scores
- Map aggregate to mood label
- Display mood summary in UI

## User Intervention

- None required.
