#\!/bin/bash
# Dotfiles Installation Script
set -e
DOTFILES_DIR="$HOME/dotfiles"
RED="\033[0;31m"; GREEN="\033[0;32m"; YELLOW="\033[0;33m"; NC="\033[0m"
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
create_symlink() {
    local src="$1" dest="$2"
    if [ -L "$dest" ]; then rm "$dest"; ln -s "$src" "$dest"; log_info "Updated: $dest -> $src"
    elif [ -f "$dest" ] || [ -d "$dest" ]; then mv "$dest" "${dest}.backup.$(date +%Y%m%d%H%M%S)"; ln -s "$src" "$dest"; log_warn "Backed up and linked: $dest"
    else ln -s "$src" "$dest"; log_info "Created: $dest -> $src"; fi
}
echo ""; echo "=== Dotfiles Installation ==="; echo ""
[ \! -d "$DOTFILES_DIR" ] && echo "Dotfiles not found" && exit 1
[ -f "$DOTFILES_DIR/shell/.zshrc" ] && create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/git/.gitconfig" ] && create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
echo ""; echo "=== Installation Complete ==="; echo ""
