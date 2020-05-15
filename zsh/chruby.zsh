# Reload chruby by running
# `chruby reload`

function reload_chruby {
  # base chruby function, aliased to original_chruby
  if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    eval "original_$(declare -f chruby)"

    # chruby wrapper that includes reloading available rubies
    function chruby {
      if [[ $1 == "reload" ]]; then
        reload_chruby
      else
        original_chruby "$@"
      fi
    }

  fi
}

reload_chruby

# chruby .ruby-version support
if [[ -f /usr/local/opt/chruby/share/chruby/auto.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi
