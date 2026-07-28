## GitHub Access
When a task requires access to GitHub:
1. First use the available GitHub integration (plugin, connector, MCP).
2. If the integration does not provide the required capability or information, use the GitHub CLI in the host environment. Do not run `gh` inside the sandbox because authentication is not available there.
3. If `gh` in the host environment is not authenticated, stop and ask me to authenticate or reauthorize it.
4. Never use computer-use tools, browser automation, or the GitHub website UI to access or modify GitHub.
