# Feature Spec: GitHub API Integration

## Objective

Fetch a user's recent commit history from GitHub.

## Steps

1. Add HTTP and dotenv dependencies to the project.
2. Create a GitHub service class to fetch public events for a username.
3. Use a GitHub token for authenticated requests.
4. Parse and return commit data (limit to 50 most recent commits).
5. Handle errors (network, invalid username, rate limits).
6. UI: Input for username, button to fetch, display commit count and sample message.

## Pseudocode

- User enters GitHub username
- On button press:
  - Call GitHubService.fetchRecentCommits(username)
  - If success: display commit count and sample message
  - If error: show error message

## User Intervention

- Provide a valid GitHub token in `.env`.
