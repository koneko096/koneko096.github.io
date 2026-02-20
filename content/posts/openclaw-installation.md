+++
Categories = ["AI", "OpenClaw", "Tutorial"]
Tags = ["OpenClaw", "AI Assistant", "Installation", "Telegram", "DDG"]
date = "2026-02-20"
title = "Installing and Integrating OpenClaw Locally with Telegram and DuckDuckGo"
type = "posts"
+++

# Installing and Integrating OpenClaw Locally with Telegram and DuckDuckGo

This guide will walk you through setting up OpenClaw, a powerful AI assistant, on your local machine, and integrating it with Telegram for seamless communication and DuckDuckGo for web search capabilities.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

*   **Node.js (LTS version recommended):** OpenClaw is built on Node.js and requires it for execution.

## Local Installation of OpenClaw

The recommended and simplest way to install OpenClaw is via its global npm package. This method handles Node.js dependencies and sets up OpenClaw for immediate use without needing to clone the entire repository.

1.  **Install OpenClaw Globally:**
    Open your terminal or command prompt and execute the following command. Depending on your system, you might need administrator privileges (e.g., `sudo` on Linux/macOS, or an elevated command prompt on Windows).
    ```bash
    npm install -g openclaw@latest
    ```
    This command installs the OpenClaw CLI tool globally on your system.

2.  **Initial Configuration (Optional):**
    After installation, you can run the `openclaw configure` command to set up essential configurations, such as your OpenAI API key or other integrations.
    ```bash
    openclaw configure
    ```
    Alternatively, for advanced setups, you can manually create a `config.yaml` file in your OpenClaw home directory (usually `~/.openclaw` or `C:\Users\<username>\.openclaw`) by copying the example:
    ```bash
    cp ~/.openclaw/config.example.yaml ~/.openclaw/config.yaml
    ```
    Then, open `config.yaml` in your preferred text editor to customize settings.

3.  **Run OpenClaw:**
    To start OpenClaw, simply type:
    ```bash
    openclaw start
    ```
    For persistent operation, especially on servers, consider using a process manager like `pm2` or a system service.

## Integrating with Telegram

To enable OpenClaw to interact via Telegram, you need to configure the Telegram plugin.

1.  **Obtain a Telegram Bot Token:**
    *   Talk to BotFather on Telegram (@BotFather).
    *   Send `/newbot` and follow the instructions to create a new bot.
    *   BotFather will give you an API Token. Keep this token secure.

2.  **Configure `config.yaml` for Telegram:**
    Edit your `config.yaml` file to add the Telegram channel details. Look for the `channels` section and add or modify the Telegram entry:
    ```yaml
    channels:
      telegram:
        enabled: true
        token: "YOUR_TELEGRAM_BOT_TOKEN" # Replace with your actual token
        # You might also want to add allowed_users or allowed_chats for security
        # allowed_users:
        #   - "YOUR_TELEGRAM_USER_ID"
    ```
    Replace `"YOUR_TELEGRAM_BOT_TOKEN"` with the token you obtained from BotFather. You can find your Telegram user ID by messaging `@userinfobot` on Telegram.

3.  **Restart OpenClaw:**
    After modifying `config.yaml`, restart OpenClaw for the changes to take effect.
    ```bash
    npm restart # if using npm start directly, you'll need to stop and start again
    ```

## Integrating DuckDuckGo Search

OpenClaw can leverage DuckDuckGo for web searches through its `ddg-search` skill, which is often included by default and requires minimal setup.

1.  **Verify `ddg-search` Skill Availability:**
    OpenClaw's skills are managed within your OpenClaw workspace (typically `~/.openclaw/workspace/skills`). The `ddg-search` skill should be present there. You can list your active skills using `openclaw skills list` to confirm its availability.

2.  **No API Key or Configuration Needed:**
    A significant advantage of the `ddg-search` skill is that it operates without requiring an external API key or additional configuration in your `config.yaml`. OpenClaw is designed to automatically utilize this skill when you make a web search request.

3.  **Usage:**
    With the `ddg-search` skill available, you can simply ask OpenClaw to find information for you, for example: "Search for the latest trends in generative AI."

This comprehensive setup will provide you with a powerful, locally-hosted AI assistant capable of interacting through Telegram and performing web searches via DuckDuckGo, laying the foundation for even more advanced AI capabilities.

## Installing and Configuring Gemini CLI

The Gemini Command Line Interface (CLI) allows you to interact with Google's Gemini models directly from your terminal, offering a powerful way to integrate advanced AI capabilities into your workflow.

### Installation

The easiest way to install the Gemini CLI is via `npm` (Node Package Manager) globally:

```bash
npm install -g @google/gemini-cli
```

Depending on your operating system and npm setup, you might need to run this command with `sudo` (Linux/macOS) or in an elevated command prompt (Windows).

### Authentication and Model Setup

To use the Gemini CLI, you need to authenticate with your Google account and often provide an API key.

1.  **Obtain a Gemini API Key:**
    *   Visit [Google AI Studio](https://aistudio.google.com/).
    *   Generate a new API key. Keep this key secure and do not share it publicly.

2.  **Configure the API Key:**
    You can make your API key available to the Gemini CLI in a few ways:

    *   **Using the `gemini config` command:**
        This is the recommended method for persistent configuration.
        ```bash
        gemini config set api-key YOUR_GEMINI_API_KEY
        ```
        Replace `YOUR_GEMINI_API_KEY` with the actual key you obtained from Google AI Studio.

    *   **Using an environment variable:**
        For temporary use or in scripts, you can set the `GOOGLE_API_KEY` environment variable:
        ```bash
        export GOOGLE_API_KEY="YOUR_GEMINI_API_KEY"
        # For Windows Command Prompt: set GOOGLE_API_KEY="YOUR_GEMINI_API_KEY"
        # For Windows PowerShell: $env:GOOGLE_API_KEY="YOUR_GEMINI_API_KEY"
        ```
        Note that environment variables are usually session-specific. For permanent environment variables, you'll need to add them to your shell's profile file (e.g., `.bashrc`, `.zshrc`, or system environment variables on Windows).

3.  **Verify Installation:**
    You can test your Gemini CLI installation and configuration by running a simple command:
    ```bash
    gemini models list
    ```
    This command should list the available Gemini models if your setup is correct.

With the Gemini CLI installed and configured, you can now leverage powerful AI models for various tasks directly from your command line, complementing your OpenClaw assistant capabilities.