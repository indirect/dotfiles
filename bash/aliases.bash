# aliases
alias ...='cd .. ; cd ..; ls'
alias ..='cd ..; ls'
alias b='bundle exec'
alias bis='bip --standalone --jobs 0'
alias cdb='cd $OLDPWD'
alias cpan="perl -MCPAN -e shell"
alias cpd="pwd | pbcopy"
alias d="ruby -Ilib -S"
alias ddbundle="DEBUG=true dbundle"
alias drbundle="DEBUG_RESOLVER=true dbundle"
alias dsrm='find . -name ".DS_Store" -exec rm \{} \;'
alias dus='du -ks * | sort -rn' # Lists the size of all the folders and files
alias emacs="emacs -nw"
alias fs='foreman start'
alias g='grep -i' #case insensitive grep
alias gba="git branch -va --color | grep -v 'remotes/origin/pr'"
alias gbl="git branch -vv --color | grep -v '\[.*\/.*\] '"
alias gbr="git branch -vr --color | grep -v 'origin/HEAD'"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gds="git diff --cached"
alias gdw="git diff --word-diff"
alias gf="git fetch --all"
alias gi="git commit -v"
alias gia="git commit --amend -v"
alias gl="git lg"
alias gs="git status -sb"
alias histogram="sort | uniq -c | sort -r"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E 'Host\: .*|GET \/.*'"
alias l="ls"
alias la="ls -lahF"
alias ld="ls -lahFd"
alias le="ls -lde"
alias ll="ls -lh"
alias mux="tmux-named"
alias md="open -a Marked"
alias mdwtf='sudo fs_usage -w -f filesys mdworker'
alias pngfix='pngcrush -rem cHRM -rem gAMA -rem iCCP -rem sRGB'
alias rbcrm='find . -name "*.rbc" -exec rm \{} \;'
alias rl='less log/development.log'
alias unbz2="bunzip2"
alias ungzip="gzip -d"
alias untar="tar xzfv"
alias untarz="tar xzfj"
alias wget-site='wget -m -p -c -k --user-agent="" -e robots=off --wait 1'
alias youtube-dl-playlist='youtube-dl -U; youtube-dl -f 38/37/22/18 -o "%(autonumber)s %(title)s.%(ext)s"' # M4V from YouTube page or playlist URL
alias youtube-dl-m4v='youtube-dl -U; youtube-dl -f 38/37/22/18 -o "%(title)s.%(ext)s"' # M4V from YouTube page or playlist URL
alias youtube-dl-audio='youtube-dl -U; youtube-dl -f bestaudio --embed-thumbnail --add-metadata'

# alias last and save
# use `als c NAME` to chop off the last argument (for filenames/patterns)
function als {
  local aliasfile chop x
  [[ $# == 0 ]] && echo "Name your alias" && return
  if [[ $1 == "c" ]]; then
    chop=true
    shift
  fi
  aliasfile=~/.bash/custom_aliases.bash
  touch $aliasfile
  if [[ `cat "$aliasfile" |grep "alias ${1// /}="` != "" ]]; then
    echo "Alias ${1// /} already exists"
  else
    x=`history 2 | sed -e '$!{h;d;}' -e x | sed -e 's/.\{7\}//'`
    if [[ $chop == true ]]; then
      echo "Chopping..."
      x=$(echo $x | rev | cut -d " " -f2- | rev)
    fi
    echo -e "\nalias ${1// /}=\"`echo $x|sed -e 's/ *$//'|sed -e 's/\"/\\\\"/g'`\"" >> $aliasfile && source $aliasfile
    alias $1
  fi
}

function back {
  ack "$@" `bundle show --paths`
}

function bi {
  bundle install "$@"
}

function bip {
  if [[ -f Gemfile.lock ]] && [[ $(tail -n 2 Gemfile.lock | tr "\n" " ") == "BUNDLED WITH    2"* ]]; then
    bundle install "$@"
  else
    GEM_REQUIREMENT_BUNDLER="~> 1.0" bundle install --path .bundle "$@"
  fi
}

function bg {
  local path=$(eval echo $(cat .bundle/config | grep BUNDLE_PATH | awk '{print $2}'))
  local arch=$(ruby -e 'print "#{RUBY_ENGINE}/#{RbConfig::CONFIG["ruby_version"]}"')
  local gems="$path/$arch/gems"
  ag "$@" "$gems"
}

function bs {
  local path=$(eval echo $(cat .bundle/config | grep BUNDLE_PATH | awk '{print $2}'))
  local arch=$(ruby -e 'print "#{RUBY_ENGINE}/#{RbConfig::CONFIG["ruby_version"]}"')
  local gems="$path/$arch/gems"
  vim "$gems/$( (cd "$gems" && find . \! \( -type d \)) | selecta)"
}

function dbundle {
  if [[ -f "$HOME/src/bundler/bundler/exe/bundle" ]]; then
    ~/src/bundler/bundler/bin/bundle "$@"
  elif [[ -f "$HOME/src/bundler/bundler/exe/bundle" ]]; then
    BUNDLE_DISABLE_POSTIT=1 ruby -I ~/src/bundler/bundler/lib ~/src/bundler/bundler/exe/bundle "$@"
  else
    ruby -I ~/src/bundler/bundler/lib ~/src/bundler/bundler/bin/bundle "$@"
  fi
}

function dbundle2 {
  ~/src/bundler/bundler/bin/bundle2 "$@"
}

function f {
  find . -not \( -path ./.git -prune \) -not \( -path ./.bundle -prune \) -iname '*'"$1"'*'
}

# clone a github repo and then cd into it
function gc {
  local repo=${1#*github.com/}
  local dir="$HOME/src/$repo"

  dir=${dir%.git}
  hub clone --recursive "$1" "$dir"
  cd "$dir"
}

function httpd {
  ruby -run -e httpd -- . -p "${1:-2000}"
}

function current_branch {
  git_status=$(git status 2> /dev/null)

  # Bail if status failed, not a git repo
  if [[ $? -ne 0 ]]; then return 1; fi

  # Try to get the branch from the status we already have
  if [[ $git_status =~ "On branch ([[:print:]]*)" ]]; then
    name="$match[1]"
  fi

  # Check the output of `branch` next
  if [[ -z "$name" ]]; then
    name=$(git branch | grep '^*' | cut -b3- | grep -v '^(')
  fi

  # Fall back on name-rev
  if [[ -z "$name" ]]; then
    name=$(git name-rev --name-only --no-undefined --always HEAD)
    name="${name#tags/}"
    name="${name#remotes/}"
  fi

  echo "$name"
}

function gp {
  local current_branch=$(current_branch)
  local upstream=$(git config branch.$current_branch.remote)

  if [[ -z "$upstream" ]]; then
    if [[ "$1" == "-f" ]]; then
      local options="-uf"
      local remote="${2-origin}"
    else
      local remote="${1-origin}"
    fi

    git push "${options--u}" "$remote" "$current_branch"
  else
    git push "$@"
  fi
}

function gpp {
  git pull --rebase
  gp "$@"
}

# make and cd to a directory
function mcd {
  mkdir -p "$@"
  cd "$@"
}

function muxi {
  tmuxinator start $@
}

function print_colours {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# grep running processes
function psg {
  ps wwwaux | egrep -i "($1|%CPU)" | grep -v grep
}

# Rails 2 and Rails 3 console
function rc {
  if [ -e "./script/console" ]; then
    ./script/console $@
  elif [ -e "./script/rails" ]; then
    ./script/rails console $@
  else
    rails console $@
  fi
}

function restart_touchbar {
  pkill "Touch Bar agent"
  killall ControlStrip
  echo "💥 TouchBar"
}
alias rtb="restart_touchbar"

# easy spec running
function s {
  if [ -e "Gemfile" ]; then
    BUNDLE="bundle exec"
  fi

  if grep -q -i "RSpec.configure do" spec/spec_helper.rb; then
    # echo "rspec2!"
    if [ -z "$*" ]; then
      $BUNDLE rspec -fd -c spec
    else
      $BUNDLE rspec -fd -c $*
    fi
  else
    # echo "rspec1!"
    if [ -z "$*" ]; then
      $BUNDLE spec _1.3.1_ -fs -c spec
    else
      $BUNDLE spec _1.3.1_ -fs -c $*
    fi
  fi
}

# remove ssh known host by line number
# -h HOSTNAME # remove by hostname
function ssh-rm-host {
  if [[ -z "$1" || ("$1" == "-h" && -z "$2") ]]; then
    echo "Usage:"
    echo "  ssh-rm-host [-l] LINENUMBER"
    echo "  ssh-rm-host -h HOSTNAME"
  elif [ "$1" == "-h" ] && [ -n "$2" ]; then
    echo ssh-keygen -R $2
  else
    echo sed -i.old "${2-$1}d" ~/.ssh/known_hosts
  fi
}

function tc {
  local path="$HOME/src/bundler/testcases/$@"
  mkdir -p "$path"
  cd "$path"
}

# install git URL as vim plugin
function vpi {
  cd ~/.vim/bundle
  git submodule add $1
  cd -
}

# vim file selecta
function vs {
  vim `(git ls-files --modified --cached --other --exclude-standard | sort | uniq) | selecta`
}

function mvs {
  mvim `(git ls-files --modified --cached --other --exclude-standard | sort | uniq) | selecta`
}

function gb {
  if [[ -z "$1" ]]; then
    git branch -v
  else
    git branch | grep -v "^*" | fzf -f "$1" | head -n1 | xargs git checkout
  fi
}

# bundler test-case named $@
function tc {
  local path="$HOME/src/bundler/testcases/$@"
  mkdir -p "$path"
  cd "$path"
}

# colorize man pages
function man {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

function wallpaper {
  osascript -e 'tell application "Finder" to set desktop picture to POSIX file "$1"'
  killall Dock
}

function mate {
  mvim "$@"
}

# bundle open selecta
function bs {
  local path=$(eval echo $(cat .bundle/config | grep BUNDLE_PATH | awk '{print $2}'))
  local arch=$(ruby -e 'print "#{RUBY_ENGINE}/#{RbConfig::CONFIG["ruby_version"]}"')
  local gems="$path/$arch/gems"
  vim "$gems/$((cd $gems && find * \! \( -type d \)) | selecta)"
}
