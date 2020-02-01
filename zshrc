# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

export PAGER="less" # page with less not more
export EDITOR="vim"
export BROWSER="open" # opens URLs in the default OS X browser
export LESS="-XFRf" # Fix less to not clear screen on exit, show color
export CLICOLOR=true # ls with color
export RI="-f ansi" # ri with color
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# switch edit mode back to emacs despite EDITOR being vim
bindkey -e

# Load Bash external packages
autoload -Uz bashcompinit && bashcompinit
bash_packages=(
  /usr/local/etc/profile.d/autojump.sh
  /usr/local/etc/profile.d/bash_completion.sh
)
for file in $bash_packages; do
  [[ -f $file ]] && source $file
done

# Load zsh functions, autocomplete and local
autoload -Uz compinit && compinit
function_paths=(
  /usr/local/share/zsh/site-functions
  ~/.zsh/functions
)
for function_path in $function_paths; do
  if [[ ! (($fpath[(Ie)$function_path])) ]]; then
    fpath+=$function_path
    for func in $(ls $function_path); do
      autoload $func
    done
  fi
done

# Load chruby
source ~/.bash/chruby.bash
export DEFAULT_RUBY_VERSION=2.6.5
chruby $DEFAULT_RUBY_VERSION

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Load bash shortcuts and functions
source ~/.bash/aliases.bash

alias cat=bat
alias l=exa
alias la='exa -la --git'
alias less=bat
alias ll='exa -ll --git'
alias lt='exa -T'

external_packages=(
  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)
for file in $external_packages; do
  [[ -f $file ]] && source $file
done

# prefix search history with up and down
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# this somehow fixes the prefix search for up and down
if (( $+terminfo[smkx] && $+terminfo[rmkx] )); then
  function enable-term-application-mode() { echoti smkx }
  function disable-term-application-mode() { echoti rmkx }
  zle -N enable-term-application-mode
  zle -N disable-term-application-mode
  autoload -Uz add-zle-hook-widget
  add-zle-hook-widget line-init enable-term-application-mode
  add-zle-hook-widget line-finish disable-term-application-mode
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/src/romkatv/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
