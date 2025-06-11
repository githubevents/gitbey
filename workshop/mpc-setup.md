# Setting up Perplexity and GitHub MCP Servers

## Prerequisites
- Docker installed on your machine
- VS Code with MCP extension
- GitHub Personal Access Token
- Perplexity API Key

## Setup Instructions

### 1. Create Required Tokens

**Get GitHub Token:**
1. Go to GitHub Settings → Developer Settings → Personal Access Tokens
2. Create a new token with required permissions
3. Copy the token for later use

**Get Perplexity API Key:**
1. Visit [Perplexity AI](https://www.perplexity.ai/)
2. Get your API key from account settings
3. Copy the key for later use

### 2. Configure VS Code Settings

1. Create or update mcp.json:

````jsonc
{
    "inputs": [
        {
            "type": "promptString",
            "id": "perplexity-key",
            "description": "Perplexity API Key",
            "password": true
        },
        {
            "type": "promptString",
            "id": "github_token",
            "description": "GitHub Personal Access Token",
            "password": true
        }
    ],
    "servers": {
        "github": {
            "command": "docker",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "GITHUB_PERSONAL_ACCESS_TOKEN",
                "ghcr.io/github/github-mcp-server"
            ],
            "env": {
                "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
            }
        },
        "perplexity-ask": {
            "command": "docker",
            "args": [
                "run",
                "-i",
                "--rm",
                "-e",
                "PERPLEXITY_API_KEY",
                "mcp/perplexity-ask"
            ],
            "env": {
                "PERPLEXITY_API_KEY": "${input:perplexity-key}"
            }
        }
    }
}
````

### 3. Start the Servers

1. Open VS Code Command Palette (`Cmd + Shift + P`)
2. Type "MCP: Start Servers"
3. VS Code will prompt for:
   - Perplexity API Key
   - GitHub Personal Access Token

### 4. Verify Setup

Check if servers are running:
````bash
docker ps
````

You should see containers for:
- `github-mcp-server`
- `perplexity-ask`

### 5. Troubleshooting

If servers don't start:
1. Check Docker is running:
````bash
docker --version
````

2. Verify token permissions:
````bash
curl -H "Authorization: token YOUR_GITHUB_TOKEN" https://api.github.com/user
````

3. Reset credentials:
   - Open Command Palette
   - Type "MCP: Clear Stored Inputs"
   - Restart servers with new tokens
