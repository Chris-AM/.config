# ~/.config

Configuración del entorno de desarrollo. Clonado en `~/.config/`.

Repo: `git@github.com:Chris-AM/.config.git`

---

## Setup en máquina nueva

```bash
# 1. Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Clonar este repo
git clone git@github.com:Chris-AM/.config.git ~/.config

# 3. Correr bootstrap
bash ~/.config/bootstrap.sh
```

El script instala Homebrew packages, oh-my-zsh, plugins, symlinks, crontab y repos. Termina con una lista de credenciales a completar manualmente.

---

## Credenciales (post-bootstrap)

Llenar `~/.gotoh/secrets` y `~/portfolio/personal_agent/.env`:

| Variable | Fuente |
|---|---|
| `ANTHROPIC_API_KEY` | console.anthropic.com |
| `NOTION_TOKEN` | Notion → Settings → Connections → Gotoh |
| `GITHUB_TOKEN` | github.com → Settings → Developer settings → PAT |
| `SLACK_BOT_TOKEN` | api.slack.com → Apps → Gotoh |
| `SLACK_SOCKET_TOKEN` | api.slack.com → Apps → Gotoh |
| `OUTLOOK_CLIENT_ID` | Azure Portal → App registrations → Gotoh |
| `APPLE_ID` + app-specific password | appleid.apple.com |
| `gmail_credentials.json` | Google Cloud Console → OAuth 2.0 clients → descargar JSON |

Los tokens de sesión OAuth (`gmail_token.json`, `outlook_token.json`) se regeneran solos en el primer run de `email_processor.py`.

---

## Estructura relevante

```
~/.config/
├── shell/
│   ├── zshrc          ← fuente real de ~/.zshrc
│   └── p10k.zsh       ← tema Powerlevel10k
├── git/
│   └── config         ← git global (leído nativamente por XDG)
├── gotoh/
│   ├── bin/gotoh      ← script gotoh en PATH
│   ├── secrets.template
│   └── crontab.txt    ← crons de Gotoh
├── claude/
│   └── settings.json  ← Claude Code
├── nvim/              ← LazyVim
├── yabai/             ← tiling WM
├── skhd/              ← atajos de teclado
├── Brewfile           ← paquetes Homebrew
└── bootstrap.sh       ← setup completo
```

---

## Requisitos previos al clone

### Homebrew path (Apple Silicon)
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### iTerm2
```bash
brew install --cask iterm2
```

### Colores iTerm2 (coolnight)
```bash
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors \
  --output ~/Downloads/coolnight.itermcolors
```
Importar en iTerm2 → Profiles → Colors.

### Yabai: configuración de macOS
1. Abrir ~7 escritorios
2. Keyboard → Shortcuts → Mission Control → activar Ctrl+1…7
3. System Settings → Accessibility → Display → Reduce Motion: ON
4. Desktop & Dock → Mission Control → desactivar "Rearrange Spaces Automatically"
5. Instalar: `brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd`
