function reload_chruby {
  # base chruby function, aliased to original_chruby
  if [[ -f /opt/boxen/chruby/share/chruby/chruby.sh ]]; then
    source /opt/boxen/chruby/share/chruby/chruby.sh
    eval "original_$(declare -f chruby)"
  fi

  # chruby wrapper that includes reloading available rubies
  function chruby {
    if [[ $1 == "reload" ]]; then
      reload_chruby
    else
      original_chruby "$@"
    fi
  }
}

reload_chruby

# chruby .ruby-version support
if [[ -f /opt/boxen/chruby/share/chruby/auto.sh ]]; then
  source /opt/boxen/chruby/share/chruby/auto.sh
fi

# chruby tab completion
complete -W "$(chruby | tr -d '* ')" chruby
