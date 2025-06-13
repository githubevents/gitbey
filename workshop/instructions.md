# 🎵 GitBey Workshop: Step-by-Step Guide

> **Build a mobile app that transforms your GitHub commits into Beyoncé playlists using Flutter and AI!**

This workshop teaches you how to build GitBey - a Flutter app that analyzes your GitHub commit history and creates personalized Beyoncé playlists based on your coding mood.

## 📋 Prerequisites

Before starting the workshop, ensure you have:

- [ ] **iOS Simulator** installed via Xcode
- [ ] **Flutter SDK** installed and configured in VS Code
- [ ] **Git** installed on your system
- [ ] **GitHub Account** with public repositories
- [ ] **GitHub Copilot** subscription (free for students/open source)

## 🚀 Workshop Steps

### Phase 1: Setup & Research

#### Step 1: Fork and Clone Repository
```bash
# Fork the repository on GitHub, then:
git clone https://github.com/bonddevconsult/gitbey_local
cd gitbey_local
```

#### Step 2: Configure MCP Servers
Add GitHub and Perplexity MCP Servers to your development environment for enhanced AI assistance.

#### Step 3: Obtain API Keys
- **Perplexity API Key** for MCP research capabilities
- **GitHub Personal Access Token** (read, write, repo, issues permissions)

#### Step 4: Environment Setup
```bash
# Create .env file and store your API keys
echo "PERPLEXITY_API_KEY=your_key_here" >> .env
echo "GITHUB_TOKEN=your_token_here" >> .env
```

#### Step 5: Research Phase
```bash
# Run the research prompt to analyze the app idea
Follow instructions from '.github/prompts/research.prompt.md'
```

### Phase 2: Planning & Specification

#### Step 6: Generate Project Proposal
```bash
# Run the new project prompt
Follow instructions from '.github/prompts/prd.prompt.md'
```

#### Step 7: Create Implementation Plan
```bash
# Generate detailed implementation plan
Follow instructions from '.github/prompts/plan.prompt.md'
# Uses the generated docs/idea.md file
```

#### Step 8: Create GitHub Issues
```bash
# Create project tracking issues
Prompt: "create an issue in this repo for a feature"
```

#### Step 9: Generate Feature Specifications
```bash
# Create detailed feature specs
Follow instructions from '.github/prompts/spec.prompt.md'
```

### Phase 3: Implementation

#### Step 10: Implement GitHub API Integration
**Objective**: Fetch user's commit history from GitHub

```bash
# Implement GitHub API service
Prompt: "implement step 1 in this issue and plan <link to issue>"
```

**API Endpoint**: `https://api.github.com/users/$enteredHandle/events/public?per_page=100`

Key implementation points:
- Create GitHub service class
- Handle API authentication
- Parse commit data
- Error handling for network requests

#### Step 11: Build Sentiment Analysis
**Objective**: Analyze commit messages to determine coding mood

```bash
# Implement sentiment analysis
Prompt: "implement steps 2 and 3 (implement remaining steps from the spec)"
```

Implementation features:
- Local sentiment analysis algorithms
- Commit message preprocessing
- Mood classification (happy, frustrated, productive, etc.)
- Sentiment scoring system

#### Step 12: Integrate AI Models
**Objective**: Generate Beyoncé song recommendations using AI

```bash
# Integrate GitHub Models API
Prompt: "I need help integrating the GitHub Models API into the GitBey Flutter app to generate personalized Beyoncé song playlists based on GitHub commit sentiment analysis"
```

**GitHub Models API Configuration**:
- **Model**: `openai/gpt-4.1`
- **Endpoint**
- **Format**: Chat completions with system and user roles

**Why GitHub Models?**
- Free tier available for developers
- High-quality AI models
- Seamless integration with GitHub ecosystem
- No separate billing setup required

Implementation steps:
1. Create `PlaylistGenerator` class
2. Configure API authentication
3. Design prompt templates for song recommendations
4. Update `main.dart` to import the service

#### Step 13: Audio Integration (Optional)
**Objective**: Enable song playback within the app

Spotify API Integration:
- Set up Spotify Developer credentials
- Implement audio preview playback
- Create playlist UI components

### Phase 4: Testing & Debugging

#### Step 14: Iterative Development
Continue implementing features step by step:

```bash
# For each new feature
Follow instructions from 'spec.prompt.md'
```

**Debug Process**:
1. Test each feature individually
2. Use GitHub Copilot for debugging assistance
3. Create new issues for bugs found
4. Implement fixes using AI-assisted development

## 🎯 Key Learning Objectives

### Technical Skills
- **Flutter Development**: Cross-platform mobile app creation
- **API Integration**: GitHub REST API and AI services
- **Sentiment Analysis**: Text processing and mood detection
- **AI Integration**: Using GitHub Models for content generation

### Agentic Development
- **AI-Assisted Coding**: Effective prompting techniques
- **Iterative Development**: Breaking complex tasks into manageable pieces
- **Automated Documentation**: Using AI for code documentation
- **Debug Assistance**: Leveraging AI for troubleshooting

## 🔧 Development Workflow

1. **Plan**: Use AI prompts to generate specifications
2. **Implement**: Build features step-by-step with Copilot assistance
3. **Test**: Validate functionality on iOS simulator
4. **Debug**: Use AI to identify and fix issues
5. **Iterate**: Refine features based on testing

## 📱 Expected App Features

By the end of the workshop, your GitBey app will:
- ✅ Accept GitHub username input
- ✅ Fetch and display recent commits
- ✅ Analyze commit sentiment
- ✅ Generate personalized Beyoncé playlists
- ✅ Display song recommendations with beautiful UI
- ✅ (Optional) Play song previews

## 🤖 AI-Powered Development Tips

- **Use specific prompts**: Reference exact files and functions
- **Break down complex tasks**: Implement one feature at a time
- **Leverage context**: Include relevant code snippets in prompts
- **Iterate quickly**: Use AI for rapid prototyping and testing


**Happy coding with AI assistance! 🚀**