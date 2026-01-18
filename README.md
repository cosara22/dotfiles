# Cosara dotfiles

WSL2 (Ubuntu 24.04) 開発環境の設定ファイル管理

## 構成

dotfiles/
- git/.gitconfig      # Git設定
- shell/              # シェル設定（予定）
- editors/            # エディタ設定（予定）
- wsl/                # WSL設定（参照用）

## セットアップ

クローン:
  git clone https://github.com/cosara857/dotfiles.git ~/dotfiles

シンボリックリンク作成:
  ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

## 環境

- OS: Ubuntu 24.04 LTS (WSL2)
- Shell: bash
- Editor: VS Code / Cursor
