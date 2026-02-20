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

*   **Git:** For cloning the OpenClaw repository.
*   **Node.js (LTS version recommended):** OpenClaw is built on Node.js.

## Local Installation of OpenClaw

Follow these steps to get OpenClaw up and running:

1.  **Clone the OpenClaw Repository:**
    Open your terminal or command prompt and execute:
    ```bash
    git clone https://github.com/openclaw/openclaw.git
    cd openclaw
    ```

2.  **Install Dependencies:**
    Navigate into the cloned directory and install the necessary Node.js packages:
    ```bash
    npm install
    ```

3.  **Configure OpenClaw:**
    OpenClaw uses a `config.yaml` file for configuration. You'll likely need to create one by copying the example:
    ```bash
    cp config.example.yaml config.yaml
    ```
    Then, open `config.yaml` in your preferred text editor to customize settings.

4.  **Run OpenClaw:**
    You can start OpenClaw using:
    ```bash
    npm start
    ```
    For persistent operation, consider using a process manager like `pm2`.

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

OpenClaw can leverage DuckDuckGo for web searches using a built-in skill. This often requires minimal configuration.

1.  **Ensure `ddg-search` Skill is Present:**
    OpenClaw typically includes a `ddg-search` skill by default. You can verify its presence by listing available skills. If it's missing, you may need to add it to your `skills` directory or enable it in `config.yaml` if it's a bundled skill.

2.  **No API Key Required:**
    The `ddg-search` skill usually does not require an API key, making it straightforward to use. OpenClaw will automatically use this skill when you ask it to search the web.

3.  **Usage:**
    Once integrated, you can simply ask OpenClaw to search for information, e.g., "Search for the latest news on AI."

This comprehensive setup will provide you with a powerful, locally-hosted AI assistant capable of interacting through Telegram and performing web searches via DuckDuckGo.