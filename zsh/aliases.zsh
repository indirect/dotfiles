alias ...='cd .. ; cd ..; ls'
alias ..='cd ..; ls'
alias b='bundle exec'
alias dsrm='find . -name ".DS_Store" -exec rm \{} \;'
alias f='fd'
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
alias l="ls"
alias l=exa
alias la="ls -lahF"
alias la='exa -la --git --icons'
alias less=bat
alias ll='exa -ll --git --icons'
alias lt='exa -T'
alias man=batman
alias md="open -a Marked\ 2"
alias mdwtf='sudo fs_usage -w -f filesys mdworker'
alias mux="tmux-named"
alias rc="bin/rails console"
alias s="bin/rspec"
alias tree="exa --tree"
alias unbz2="bunzip2"
alias ungzip="gzip -d"