#!/bin/bash
# =============================================================================
# Dotfiles Installation Script
# =============================================================================
set -e

DOTFILES_DIR="$HOME/dotfiles"

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
NC="\033[0m"

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_section() { echo -e "\n${BLUE}=== $1 ===${NC}\n"; }

# -----------------------------------------------------------------------------
# Create symlink with backup
# -----------------------------------------------------------------------------
create_symlink() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$src" ]; then
        log_error "Source not found: $src"
        return 1
    fi

    if [ -L "$dest" ]; then
        rm "$dest"
        ln -s "$src" "$dest"
        log_info "Updated: $dest -> $src"
    elif [ -f "$dest" ] || [ -d "$dest" ]; then
        local backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$backup"
        ln -s "$src" "$dest"
        log_warn "Backed up existing file to: $backup"
        log_info "Created: $dest -> $src"
    else
        ln -s "$src" "$dest"
        log_info "Created: $dest -> $src"
    fi
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
main() {
    log_section "Dotfiles Installation"

    # Check dotfiles directory
    if [ ! -d "$DOTFILES_DIR" ]; then
        log_error "Dotfiles directory not found: $DOTFILES_DIR"
        exit 1
    fi

    cd "$DOTFILES_DIR"
    log_info "Working directory: $DOTFILES_DIR"

    # Shell configuration
    log_section "Shell Configuration"
    if [ -f "$DOTFILES_DIR/shell/.zshrc" ]; then
        create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
    fi

    # Git configuration
    log_section "Git Configuration"
    if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
        create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
    fi

    # Editor configuration (future)
    log_section "Editor Configuration"
    if [ -d "$DOTFILES_DIR/editors/vscode" ]; then
        log_info "VS Code settings found (manual sync recommended)"
    else
        log_info "No editor configuration found (skipped)"
    fi

    # Summary
    log_section "Installation Complete"
    echo "Installed symlinks:"
    ls -la "$HOME/.zshrc" 2>/dev/null || true
    ls -la "$HOME/.gitconfig" 2>/dev/null || true

    echo ""
    log_info "Run 'source ~/.zshrc' to reload shell configuration"
}

main "$@"
