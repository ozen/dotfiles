# dotfiles

Personal shell and development environment configuration for macOS and Linux.

## Contents

| Path | Description |
| --- | --- |
| `Brewfile` | Homebrew bundle containing top-level CLI tools, applications, VS Code extensions, Krew plugins, and npm packages. |
| `setup` | Initializes Git submodules, creates a personal Git config, and links every `*.symlink` file or directory into the home directory. |
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
