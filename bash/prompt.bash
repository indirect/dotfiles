GIT=$(which git)

RED='\001\033[31m\002'
GREEN='\001\033[32m\002'
YELLOW='\001\033[33m\002'
BLUE='\001\033[34m\002'
MAGENTA='\001\033[35m\002'
CYAN='\001\033[36m\002'
GREY='\001\033[38;5;252m\002'
BLACK='\001\033[38;5;232m\002'

ON_BLACK='\001\033[48;5;232m\002'
ON_CLEAR='\001\033[49m\002'

RESET='\001\033[0m\002'

ARROW=''

function status_color {
  if [[ "$1" != *"nothing to commit"* ]]; then
    printf "$YELLOW"
  elif [[ "$1" == *"branch is ahead"* ]]; then
    printf "$CYAN"
  elif [[ "$1" == *"branch is behind"* ]]; then
    printf "$MAGENTA"
  elif [[ "$1" == *"diverged"* ]]; then
    printf "$RED"
  else
    printf "$GREEN"
  fi
}

function exit_status {
  if [[ $? -eq 0 ]]; then
    printf "💙 "
  else
    printf "💔 "
  fi
}

function ruby_status {
  case $RUBY_VERSION in
    "") printf "◽️ ";;
    2.5.?) printf "💠 ";;
    2.4.?) printf "🔹 ";;
    2.[0-9].?) printf "🔸 ";;
    1.9.?) printf "🔺 ";;
    1.8.?) printf "🔻 ";;
    *) printf "❓ ($RUBY_VERSION) ";;
  esac
}

function dotfiles_status_colorize {
  if [[ "us-aarko" == "$HOSTNAME" ]]; then
    printf $1; return;
  fi

  dotfiles="$HOME/src/indirect/dotfiles"
  status_color "$($GIT --git-dir=$dotfiles/.git --work-tree=$dotfiles status 2> /dev/null)"
  printf $1
}

function git_status {
  local status
  local branch_exp
  local name

  status=$($GIT status 2> /dev/null)

  # Bail if status failed, not a git repo
  if [[ $? -ne 0 ]]; then return 1; fi

  local branch_exp="On branch (.*?) "
  # Try to get the branch from the status we already have
  if [[ "$status" =~ $branch_exp ]]; then
    name="${BASH_REMATCH[1]}"
  fi

  # Check the output of `branch` next
  if [[ -z "$name" ]]; then
    name=$($GIT branch | grep '^*' | cut -b3- | grep -v '^(')
  fi

  # Fall back on name-rev
  if [[ -z "$name" ]]; then
    name=$($GIT name-rev --name-only --no-undefined --always HEAD)
    name="${name#tags/}"
    name="${name#remotes/}"
  fi

  status_color "$status"
  printf "$name $remote"
}

function job_status {
  [[ $1 -gt 0 ]] && printf "👥  "
}

export PS1="$ON_BLACK\$(exit_status) \$(ruby_status) \$(dotfiles_status_colorize \u) $BLUE\w \$(git_status)\$(job_status \j)$BLACK$ON_CLEAR$ARROW $RESET"
