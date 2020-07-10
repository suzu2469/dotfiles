source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Go Settings
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# PATH Settings
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin/node
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:`yarn global bin`

# Peco Settings
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^p' peco-src

