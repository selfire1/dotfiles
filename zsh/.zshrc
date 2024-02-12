
# Functions
isod() {
  if [ "$1" != "" ] # or better, if [ -n "$1" ]
  then
    date -j -f "%Y%m%d" "$1" +'%Y-%m-%dT00:00:01+10:00'
  else
    date +"%Y-%m-%dT00:00:01+10:00"
  fi
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

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# node
export NODE_OPTIONS="--max-old-space-size=8192"

# export NODE_PATH=$NODE_PATH:`npm root -g`

# Python
eval "$(pyenv init --path)" 

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
