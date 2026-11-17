#!/usr/bin/env bash
# bootstrap.sh — Setup completo en máquina nueva.
# Correr después de clonar ~/.config desde GitHub.
set -e

PORTFOLIO="$HOME/portfolio"

echo "==> Homebrew"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew bundle --file="$HOME/.config/Brewfile"

echo "==> oh-my-zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[[ -d "$ZSH_CUSTOM/themes/powerlevel10k" ]] || \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
[[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "==> ~/.zshrc"
echo "source ~/.config/shell/zshrc" > "$HOME/.zshrc"

echo "==> ~/.gitconfig"
# git lee ~/.config/git/config de forma nativa (XDG). No se necesita ~/.gitconfig.
rm -f "$HOME/.gitconfig"

echo "==> ~/.gotoh"
mkdir -p "$HOME/.gotoh/bin"
ln -sf "$HOME/.config/gotoh/bin/gotoh" "$HOME/.gotoh/bin/gotoh"
if [[ ! -f "$HOME/.gotoh/secrets" ]]; then
  cp "$HOME/.config/gotoh/secrets.template" "$HOME/.gotoh/secrets"
  echo "  ⚠️  Llena $HOME/.gotoh/secrets con tus tokens antes de usar Gotoh."
fi

echo "==> portfolio"
mkdir -p "$PORTFOLIO"
[[ -d "$PORTFOLIO/personal_agent" ]] || \
  git clone git@github.com:Chris-AM/Gotoh.git "$PORTFOLIO/personal_agent"

echo "==> Claude Code settings"
mkdir -p "$HOME/.claude"
ln -sf "$HOME/.config/claude/settings.json" "$HOME/.claude/settings.json"

echo ""
echo "✅ Setup base completo."
echo ""
echo "Credenciales pendientes (llenar en ~/.gotoh/secrets y ~/.env de personal_agent):"
echo "  • ANTHROPIC_API_KEY   → console.anthropic.com"
echo "  • NOTION_TOKEN        → Notion → Settings → Connections → Gotoh"
echo "  • GITHUB_TOKEN        → github.com → Settings → Developer settings → PAT"
echo "  • SLACK_BOT_TOKEN     → api.slack.com → Apps → Gotoh"
echo "  • SLACK_SOCKET_TOKEN  → api.slack.com → Apps → Gotoh"
echo "  • OUTLOOK_CLIENT_ID   → Azure Portal → App registrations → Gotoh"
echo "  • APPLE_ID + password → appleid.apple.com (app-specific password)"
echo "  • gmail_credentials.json → Google Cloud Console → OAuth 2.0 clients"
echo ""
echo "Pasos manuales:"
echo "  1. Abre una nueva terminal para que tome el .zshrc"
echo "  2. cd ~/portfolio/personal_agent && uv sync"
echo "  3. Instala git hooks por proyecto: GOTOH_PROJECT=conectemos uv run python scripts/dev_flow.py setup-hooks --repo back"
