# Load chruby
source ~/.bash/chruby.bash
export DEFAULT_RUBY_VERSION=2.6.5
chruby $DEFAULT_RUBY_VERSION

# Keep go's installed files out of the way
export GOPATH=$HOME/.go

# Personal bins in dropbox and dotfiles
export PATH="$HOME/Dropbox/bin:$HOME/.bin:$PATH"

# Rustup and cargo bins path
export PATH="$HOME/.cargo/bin:$PATH"
