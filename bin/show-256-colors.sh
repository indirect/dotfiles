#!/usr/bin/env bash

PADDING='Padding'

main() {
  local xterm_start=0 \
        xterm_width=8 \
        xterm_height=2

  local cube_start=$((xterm_start + xterm_width * xterm_height)) \
        cube_width=6 \
        cube_height=$((6 * 6))

  local greys_start=$((cube_start + cube_width * cube_height)) \
        greys_width=8 \
        greys_height=3

  color_block $xterm_start $xterm_width $xterm_height
  color_block $cube_start  $cube_width  $cube_height  use_padding
  color_block $greys_start $greys_width $greys_height
  echo
}

color_block() {
  local start=$1 width=$2 height=$3 use_padding=$4
  local max s color_nums colors

  max=$((start + width * height - 1))

  echo
  for s in $(seq $start $width $max); do
    color_nums=$(seq $s $((s + width - 1)))
    colors="${use_padding:+$PADDING }${color_nums}${use_padding:+ $PADDING}"

    printf '%s%s    %s%s\n' \
      "$(fg_bars $colors)" $ansi_reset \
      "$(bg_bars $colors)" $ansi_reset
  done
}

fg_bars() {
  for color in $@; do
    color_bar ansi_fg $color ''
  done
}

bg_bars() {
  for color in $@; do
    color_bar ansi_bg $color ' '
  done
}

color_bar() {
  local ansi=$1 color=$2 trail=$3

  if [ "$color" == $PADDING ]; then
    printf '%s    %s' $ansi_reset "$trail"
  else
    local color_seq=$($ansi $color)
    printf '%s %03d%s' $color_seq $color "$trail"
  fi
}

ansi_reset=$'\033[0m'

ansi_fg() {
  printf '\033[38;5;%dm' $1
}

ansi_bg() {
  printf '\033[48;5;%dm' $1
}

main
