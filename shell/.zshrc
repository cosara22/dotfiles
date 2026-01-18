# =============================================================================
# Cosara's Zsh Configuration
# =============================================================================

# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
export LANG=ja_JP.UTF-8
export EDITOR="code --wait"
export VISUAL="code --wait"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# -----------------------------------------------------------------------------
# Path Configuration
# -----------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# fnm (Fast Node Manager)
# -----------------------------------------------------------------------------
if [ -d "$HOME/.local/share/fnm" ]; then
    export FNM_DIR="$HOME/.local/share/fnm"
    export PATH="$FNM_DIR:$PATH"
    eval "$(fnm env --use-on-cd)"
fi

# -----------------------------------------------------------------------------
# uv (Python package manager)
# -----------------------------------------------------------------------------
if [ -f "$HOME/.local/bin/uv" ]; then
    eval "$(uv generate-shell-completion zsh)"
fi

# -----------------------------------------------------------------------------
# pnpm
# -----------------------------------------------------------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -----------------------------------------------------------------------------
# History Configuration
# -----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
# Navigation
alias ll="ls -la --color=auto"
alias la="ls -A --color=auto"
alias l="ls -CF --color=auto"
alias ..="cd .."
alias ...="cd ../.."

# Git
alias gs="git status"
alias gl="git log --oneline -10"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Docker
alias dc="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"

# Development directories
alias proj="cd ~/dev/projects"
alias sand="cd ~/dev/sandbox"
alias infra="cd ~/infrastructure"

# -----------------------------------------------------------------------------
# Prompt with Git branch
# -----------------------------------------------------------------------------
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f%F{yellow}${vcs_info_msg_0_}%f %F{green}❯%f '

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# -----------------------------------------------------------------------------
# Key Bindings
# -----------------------------------------------------------------------------
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
