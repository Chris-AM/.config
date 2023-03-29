# Before Clone:

## Install Homebrew

<p align="center">
  <a href="http://brew.sh/" target="blank"><img src="https://brew.sh/assets/img/homebrew.svg" width="200" alt="Brew Logo" /></a>
</p>

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Add Homebrew To Path

- Replace [username] width your username

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Install iTerm2

<p align="center">
  <a href="https://iterm2.com/index.html" target="blank"><img src="https://icons.veryicon.com/png/Application/Enkel/iTerm.png" width="200" alt="iTerm2 Logo" /></a>
</p>

```
brew install --cask iterm2
```

## Install Oh My Zsh

<p align="center">
  <a href="https://ohmyz.sh" target="blank"><img src="https://ohmyz.sh/img/OMZLogo_BnW.png" width="200" alt="oh my zsh logo" /></a>
</p>

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install PowerLevel10K Theme for Oh My Zsh

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

1. change Theme to powerlevel10k
   `ZSH_THEME="powerlevel10k/powerlevel10k"`

2. source the changes
   `source ~/.zshrc`

3. Install Meslo Nerd Font:

- Install the font by pressing "y" and then quit iTerm2.
- Update VSCode Terminal Font (Optional and saved in User prof)
- Open settings.json and add this line:
  `"terminal.integrated.fontFamily": "MesloLGS NF"`

4. Change iTerm2 colors to Custom Theme:
   `curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ~/Downloads/coolnight.itermcolors`

- The theme will be located at ~/Downloads/coolnight.itermcolors
- Open iTerm2 preferences
- Go to Profiles > Colors
- Import the downloaded color profile (coolnight)
- Select the color profile (coolnight)

## Install ZSH Plugins

1. Install zsh-autosuggestions:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. Install zsh-syntax-highlighting:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

3. Open the "~/.zshrc" file in your desired editor and modify the plugins line to what you see below.
   `plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)`
4. Load these new plugins by running:
   `source ~/.zshrc`

## Install ripgrep for future solutions:

```
brew install ripgrep
```

## Install Flutter

<p align="center">
  <a href="https://docs.flutter.dev/get-started/install/macos" target="blank"><img src="https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png" width="200" alt="Flutter logo" /></a>
</p>

- Follow The Official Flutter [macOS install](https://docs.flutter.dev/get-started/install/macos)

## Install and configure Yabai

<p align="center">
  <a href="https://github.com/koekeishiya/yabai" target="blank"><img src="https://raw.githubusercontent.com/koekeishiya/yabai/master/assets/banner/banner.svg" width="200" alt="yabai logo" /></a>
</p>

1. Open Several Desktops (~7) on Your Machine
2. Go To Keyboard Settings > Shortcuts > Mission Control
3. Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with "Ctrl + # Of Space"
4. Go to System Settings > Accessibility > Display
5. Turn On Reduce Motion
6. Go To System Settings > Desktop & Dock > Mission Control
7. Turn off "Automatically Rearrange Spaces Based On Most Recent Use"
8. Personally, I only keep "Displays Have Separate Spaces" turned on here (optional).
9. Install Yabai:

```
brew install koekeishiya/formulae/yabai
```

10. Install Skhd:

```
brew install koekeishiya/formulae/skhd
```

# Clone The Config:

```
git@github.com:Chris-AM/.config.git
```

# After Clone:

## Install nvm

<p align="center">
  <a href="https://github.com/nvm-sh/nvm#installing-and-updating" target="blank"><img src="https://raw.githubusercontent.com/nvm-sh/logos/HEAD/nvm-logo-color.svg" width="200" alt="Brew Logo" /></a>
</p>

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

1. Add those lines in ~/.zshrc

```
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

2. source zshrc

```
source ~/.zshrc
```

3. run `nvm` to test

- If you get `nvm: command not found` after running the install script. GOTO [nvm doc](https://github.com/nvm-sh/nvm#installing-and-updating)

4. run `nvm install` to install the latest node version

## Install Github Copilot

<p align="center">
  <a href="https://github.com/github/copilot.vim" target="blank"><img src="https://github.gallerycdn.vsassets.io/extensions/github/copilotvs/1.77.2.0/1679434306107/Microsoft.VisualStudio.Services.Icons.Default" width="200" alt="Brew Logo" /></a>
</p>

```
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

- Start Neovim and invoke `:Copilot setup.`
