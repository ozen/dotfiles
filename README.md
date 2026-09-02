# dotfiles

Personal shell and development environment configuration for macOS and Linux.

## Contents

| Path | Description |
| --- | --- |
| `Brewfile` | Homebrew bundle containing top-level CLI tools, applications, VS Code extensions, Krew plugins, and npm packages. |
| `setup` | Initializes Git submodules, creates a personal Git config, and links every `*.symlink` file or directory into the home directory. |
| `agents/skills/` | Shared agent skills linked to `~/.agents/skills/`. |
| `vscode/settings.json` | Curated backup of portable VS Code user settings for manual recovery. |
| `codex/AGENTS.md` | Global Codex instructions linked to `~/.codex/AGENTS.md`. |
| `codex/config.toml` | Safe, portable Codex defaults used to bootstrap a local user configuration. |
| `codex/pets/` | Codex v2 pet packages linked into `~/.codex/pets/`. |
| `zshrc.symlink` | Oh My Zsh and Powerlevel10k setup, plugins, lazy-loaded Conda and NVM, iTerm2 integration, and SSH agent initialization. |
| `zprofile.symlink` | Platform-specific paths for Homebrew, VS Code, Krew, local binaries, PostgreSQL, and Google Cloud SDK. |
| `zshenv.symlink` | Default terminal and visual editors. |
| `aliases.zsh` | Shell aliases and helpers for Git, Kubernetes, SSH tunnels, proxies, Python environments, Terraform, Codex, and common filesystem tasks. |
| `gitconfig.symlink.example` | Git defaults and template used to generate the local `gitconfig.symlink`. |
| `vimrc.symlink` and `vim.symlink/` | Vim preferences and the vim-airline package. |
| `tmux.conf.symlink`, `screenrc.symlink`, `nanorc.symlink` | Terminal multiplexer and editor preferences. |
| `p10k.zsh` | Powerlevel10k prompt configuration. |
| `iterm2_shell_integration.zsh` | iTerm2 shell integration. |
| `oh-my-zsh/` and `oh-my-zsh-custom/` | Oh My Zsh plus the Powerlevel10k, autosuggestions, and syntax-highlighting submodules. |

## Installation

Install Git and Zsh, then clone the repository:

```sh
git clone https://github.com/ozen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

The setup script initializes the submodules and prompts before replacing,
backing up, or skipping existing dotfiles. If `gitconfig.symlink` does not
exist, it also asks for the Git author email and generates the file from the
included example.

Agent skills are symlinked from `agents/skills/` to `~/.agents/skills/`. Codex
instructions and pet assets are symlinked into `~/.codex`. On a new machine,
`codex/config.toml` is copied to `~/.codex/config.toml` as a regular local file
with mode `0600`. If a local config already exists, setup leaves it untouched
and prints a diff against the portable defaults. Project trust, private MCP
servers, machine paths, runtime state, credentials, history, databases, and
caches remain local.

To install the macOS packages and tools:

```sh
brew bundle --file="$HOME/.dotfiles/Brewfile"
```

Set Zsh as the login shell if needed:

```sh
chsh -s "$(command -v zsh)"
```

## Symlink convention

Files and directories ending in `.symlink` are linked into the home directory
with that suffix removed. For example, `zshrc.symlink` becomes `~/.zshrc` and
`vim.symlink/` becomes `~/.vim/`.

## macOS settings

Run the macOS settings script:

```sh
.dotfiles/macos
```

The configurations are explained in the comments of the script.

## VS Code settings recovery

The repository contains a curated backup of the user settings at
`vscode/settings.json`. It intentionally omits machine-specific paths,
temporary extension state, and project identifiers. The `setup` script does
not install or link this file.

If Settings Sync is unavailable or its cloud copy is lost, quit VS Code and
restore the settings manually on macOS:

```sh
mkdir -p "$HOME/Library/Application Support/Code/User"
cp "$HOME/.dotfiles/vscode/settings.json" \
    "$HOME/Library/Application Support/Code/User/settings.json"
```

The copy command replaces any existing user settings. Back up that file first
if it contains changes you want to keep. Restart VS Code after copying. The
referenced themes, formatters, and other extension-provided settings take
effect after their corresponding extensions are installed.
