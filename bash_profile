# Paths and LC are in bashrc for use by automated processes
source ~/.bashrc

# after every command, check the window size and set lines and columns
shopt -s checkwinsize
# require a second ctl-D to actually exit
export IGNOREEOF=1
# type a single space before a command to keep it out of history
export HISTCONTROL=ignorespace
# keep 10k lines of history
export HISTSIZE=10000
# append to history file when logging out, don't overwrite
shopt -s histappend
# after every command, write then read .bash_history
if [[ ! "$PROMPT_COMMAND" =~ "history -a; history -n" ]]; then
  export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
fi
# guarantee that non-Apple terminals won't try to run update_terminal_cwd
if ! type -t update_terminal_cwd > /dev/null; then
  export PROMPT_COMMAND=$(echo $PROMPT_COMMAND | sed -e 's/; update_terminal_cwd//')
fi

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Use source-highlight if it's installed
if (type -P src-hilite-lesspipe.sh &>/dev/null); then
  export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
fi

export PAGER="less" # page with less not more
export EDITOR="vim"
export BROWSER="open" # opens URLs in the default OS X browser
export LESS="-XFRf" # Fix less to not clear screen on exit, show color
export CLICOLOR=true # ls with color
export RI="-f ansi" # ri with color

# Include all of the bash setup files
for file in ~/.bash/*.{sh,bash}; do
  # exclude conflicted dropbox files
  [[ -r "$file" ]] && [[ "$file" != *"conflicted"* ]] && source "$file";
done

# Load machine-local env if it exists
[[ -r "~/.bash_local" ]] && source "~/.bash_local"

# If STDIN is a terminal
if [[ -t 0 && -z "$NONINTERACTIVE" ]]; then
  #stty erase  # Make backspace generate ^H. Not sure why, anymore.
  stty -ixon # Disable ^S and ^Q for flow control so vim can use them
  echo -n "" # clear the screen
  echo; echo
  fortune horse_ebooks | ponysay -b round 1> >(sed 's/^/     /')
  echo; echo
fi
