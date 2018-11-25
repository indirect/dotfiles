# Use UTF-8 on the command line
export LC_CTYPE=en_US.UTF-8

# paths of boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# fix boxen's credential helper location
export BOXEN_GIT_CREDENTIAL_FALLBACK=$(which git-credential-osxkeychain)

# Personal bins in dropbox and dotfiles
export PATH="$HOME/Dropbox/bin:$HOME/.bin:$PATH"

# Cargo bins path
export PATH="$HOME/.cargo/bin:$PATH"
