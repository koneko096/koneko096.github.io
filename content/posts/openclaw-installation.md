+++
Categories = ["AI", "OpenClaw", "Tutorial"]
Tags = ["OpenClaw", "AI Assistant", "Installation", "Telegram", "DDG"]
date = "2026-02-20"
title = "Installing and Integrating OpenClaw Locally with Telegram and DuckDuckGo"
type = "posts"
+++


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

To enable OpenClaw to interact seamlessly via Telegram, you need to configure the Telegram channel within your `config.yaml`. This involves obtaining a bot token and setting up appropriate access controls.

1.  **Create a Telegram Bot and Obtain Token:**
    *   Initiate a chat with the official BotFather on Telegram (@BotFather).
    *   Send the `/newbot` command and follow the prompts to create your new bot.
    *   BotFather will provide you with an API Token. **Crucially, keep this token secure and never share it publicly.**

2.  **Configure `config.yaml` for Telegram:**
    Edit your `config.yaml` file (located in your OpenClaw home directory, e.g., `~/.openclaw/config.yaml`). Add or modify the `channels` section to include your Telegram bot's details and access policies:
    ```yaml
    channels:
      telegram:
        enabled: true
        token: "YOUR_TELEGRAM_BOT_TOKEN" # Replace with your actual Bot API Token
        dmPolicy: "allowlist"            # Recommended: only allowed users can DM your bot
        allowFrom:                     # List of numeric Telegram User IDs allowed to interact via DM
          - "YOUR_TELEGRAM_USER_ID"      # Replace with your Telegram user ID
        # For group chats, consider:
        # groupPolicy: "allowlist"
        # groups:
        #   "-1001234567890": # Example group chat ID (prefix with -100)
        #     groupPolicy: "open" # Or "allowlist" with groupAllowFrom
    ```
    *   **Finding your Telegram User ID:** The safest way is to DM your bot, then run `openclaw logs --follow` in your terminal and look for the `from.id` in the inbound message log. Alternatively, you can message `@userinfobot` on Telegram.
    *   Replace `"YOUR_TELEGRAM_BOT_TOKEN"` and `"YOUR_TELEGRAM_USER_ID"` with your actual values.

3.  **Restart OpenClaw:**
    For the changes in `config.yaml` to take effect, you must restart your OpenClaw instance. If you used `openclaw start`, you'll need to stop and then start it again. If running with `pm2` or a similar process manager, use its restart command.

## Integrating DuckDuckGo Search

OpenClaw can leverage DuckDuckGo for web searches through its `ddg-search` skill, which is often included by default and requires minimal setup.

1.  **Verify `ddg-search` Skill Availability:**
    OpenClaw's skills are managed within your OpenClaw workspace (typically `~/.openclaw/workspace/skills`). The `ddg-search` skill should be present there. You can list your active skills using `openclaw skills list` to confirm its availability.

2.  **No API Key or Configuration Needed:**
    A significant advantage of the `ddg-search` skill is that it operates without requiring an external API key or additional configuration in your `config.yaml`. OpenClaw is designed to automatically utilize this skill when you make a web search request.

3.  **Usage:**
    With the `ddg-search` skill available, you can simply ask OpenClaw to find information for you, for example: "Search for the latest trends in generative AI."

This comprehensive setup will provide you with a powerful, locally-hosted AI assistant capable of interacting through Telegram and performing web searches via DuckDuckGo, laying the foundation for even more advanced AI capabilities.

## Integrating Gemini Models with OpenClaw

To harness the power of Google's Gemini models directly within OpenClaw, you need to enable the dedicated Gemini plugin and authenticate your access. This integration allows OpenClaw to utilize Gemini for its AI-driven tasks.

**Prerequisite:** Ensure you have the Gemini CLI installed as described in the "Installing and Configuring Gemini CLI" section below.

1.  **Enable the Gemini Plugin:**
    OpenClaw uses a plugin to facilitate interaction with Gemini models. Enable it using the `plugins enable` command:
    ```bash
    openclaw plugins enable google-gemini-cli-auth
    ```

2.  **Authenticate and Set Default Model:**
    After enabling the plugin, you need to log in to your Google account to authenticate with Gemini. This process automatically sets up the necessary OAuth tokens. You can also set Gemini as your default model provider:
    ```bash
    openclaw models auth login --provider google-gemini-cli --set-default
    ```
    Follow the on-screen prompts to complete the Google authentication flow. This command stores the OAuth tokens securely within your OpenClaw gateway host.

Once configured, OpenClaw will be able to access and utilize the Gemini models for tasks that require advanced AI capabilities, seamlessly integrating with your local assistant setup.

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