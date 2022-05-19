# This file requires external files that configure bash, while making sure 
# that a warning is printed any time one of those external files has been 
# deleted or isn't installed yet.

export BREW_PREFIX=`brew --prefix`
vendor=(
  $BREW_PREFIX/etc/bash_completion
  $BREW_PREFIX/etc/autojump.sh
)

for file in "${vendor[@]}"; do
  if [[ -s "$file" ]] && [[ -r "$file" ]]; then
    source "$file"
  else
    echo "Couldn't source $file"
  fi
done
