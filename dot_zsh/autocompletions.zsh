# Load zsh autocompletions
fpath+="$BREW_PREFIX/share/zsh/site-functions"
fpath+=~/.zsh/plugins/mac-zsh-completions/completions
fpath+=~/.zsh/completion
autoload -Uz compinit && compinit
