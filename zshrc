# Globbing a bit more like bash
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE

# Naming a directory runs cd for you
setopt AUTO_CD

# Shared history across all shells, updated after every command
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Break words on forward slash, so delete-word stops on directories
WORDCHARS=${WORDCHARS/\/}

# Show substitutions before running them
setopt HIST_VERIFY

# Up and down to search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Use source-highlight if it's installed
if (type -P src-hilite-lesspipe.sh &>/dev/null); then
  export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
fi

# Load functions from ~/.zsh/functions
fpath+=~/.zsh/functions
for func in $(ls ~/.zsh/functions); do
  autoload $func
done

# Load bash autocompletions
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  autoload -Uz bashcompinit && bashcompinit
  source  "/usr/local/etc/profile.d/bash_completion.sh"
fi

# Load zsh autocompletion
autoload -Uz compinit && compinit
fpath+=/usr/local/share/zsh/site-functions
for func in $(ls /usr/local/share/zsh/site-functions); do
  autoload $func
done

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Load bash shortcuts and functions
source ~/.bash/aliases.bash

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
