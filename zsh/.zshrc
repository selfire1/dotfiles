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

# Python
eval "$(pyenv init --path)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export TERM=xterm-256color
