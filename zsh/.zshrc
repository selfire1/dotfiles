# Functions
isod() {
  if [ "$1" != "" ]; then # or better, if [ -n "$1" ]
    date -j -f "%Y%m%d" "$1" +'%Y-%m-%dT00:00:01+10:00'
  else
    date +"%Y-%m-%dT00:00:01+10:00"
  fi
}

# bash
gcs() {
  BRANCH=$(git symbolic-ref --short HEAD | sed -E 's/.*\///' | {
    echo -n 'sites/'
    cat
  })
  git checkout "$BRANCH"
}

gcst() {
  BRANCH=$(git symbolic-ref --short HEAD | sed -E 's/.*\///' | {
    echo -n 'staging/'
    cat
  })
  git checkout "$BRANCH"
}

gcp() {
  BRANCH=$(git symbolic-ref --short HEAD | sed -E 's/.*\///' | {
    echo -n 'preview/'
    cat
  })
  git checkout "$BRANCH"
}

gcpd() {
  BRANCH=$(git symbolic-ref --short HEAD | sed -E 's/.*\///' | {
    echo -n 'production/'
    cat
  })
  git checkout "$BRANCH"
}

# Kitty colour changes
dark() {
  kitty @ set-colors -ac "~/.dotfiles/kitty/.config/kitty/zenbones_dark.conf"
}
light() {
  kitty @ set-colors -ac "~/.dotfiles/kitty/.config/kitty/zenbones_light.conf"
}

# Source
export PATH=/opt/homebrew/bin:$PATH
eval $(/opt/homebrew/bin/brew shellenv)
source $HOME/.aliases
export ZEIT_DB=~/.config/zeit.db
export EDITOR=nvim

# brew autocompletions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# z-zsh
source ~/.dotfiles/zsh/zsh-z.plugin.zsh
zstyle ':completion:*' menu select
autoload -U compinit && compinit

# autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship
export STARSHIP_CONFIG=~/.dotfiles/zsh/starship.toml
eval "$(/opt/homebrew/bin/starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# node
export NODE_OPTIONS="--max-old-space-size=8192"

# export NODE_PATH=$NODE_PATH:`npm root -g`

# Python
eval "$(pyenv init --path)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# # place this after nvm initialization!
# autoload -U add-zsh-hook
#
# load-nvmrc() {
#   local nvmrc_path
#   nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version
#     nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
#       nvm use
#     fi
#   elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
#
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export TERM=xterm-256color
