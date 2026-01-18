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
export XDG_CONFIG_HOME="/home/cosara/.config"
export XDG_DATA_HOME="/home/cosara/.local/share"
export XDG_CACHE_HOME="/home/cosara/.cache"

# -----------------------------------------------------------------------------
# Path Configuration
# -----------------------------------------------------------------------------
export PATH="/home/cosara/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/zeroz/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/zeroz/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/Git/cmd:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/Docker/host/bin:/mnt/c/Program Files/GitHub CLI:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312/Scripts:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/zeroz/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/zeroz/AppData/Local/Programs/cursor/resources/app/bin:/mnt/c/Users/zeroz/AppData/Local/PowerToys/DSCModules:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl"

# -----------------------------------------------------------------------------
# fnm (Fast Node Manager)
# -----------------------------------------------------------------------------
if [ -d "/home/cosara/.local/share/fnm" ]; then
    export FNM_DIR="/home/cosara/.local/share/fnm"
    export PATH=":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/zeroz/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/zeroz/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/Git/cmd:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/Docker/host/bin:/mnt/c/Program Files/GitHub CLI:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312/Scripts:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/zeroz/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/zeroz/AppData/Local/Programs/cursor/resources/app/bin:/mnt/c/Users/zeroz/AppData/Local/PowerToys/DSCModules:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl"
    eval ""
fi

# -----------------------------------------------------------------------------
# uv (Python package manager)
# -----------------------------------------------------------------------------
if [ -f "/home/cosara/.local/bin/uv" ]; then
    eval ""
fi

# -----------------------------------------------------------------------------
# pnpm
# -----------------------------------------------------------------------------
export PNPM_HOME="/home/cosara/.local/share/pnpm"
export PATH=":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/zeroz/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/zeroz/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/Git/cmd:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/Docker/host/bin:/mnt/c/Program Files/GitHub CLI:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312/Scripts:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Python312:/mnt/c/Users/zeroz/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/zeroz/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/zeroz/AppData/Local/Programs/cursor/resources/app/bin:/mnt/c/Users/zeroz/AppData/Local/PowerToys/DSCModules:/mnt/c/Users/zeroz/AppData/Local/nvm:/mnt/c/nvm4w/nodejs:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl"

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
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gl="git log --oneline -10"
alias gd="git diff"

# Docker aliases
alias dc="docker compose"
alias dps="docker ps"

# -----------------------------------------------------------------------------
# Prompt (simple)
# -----------------------------------------------------------------------------
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f%F{yellow}%f %F{green}❯%f '

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
