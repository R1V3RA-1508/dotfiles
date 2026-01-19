#!/usr/bin/env bash

wall_dir="$HOME/Pictures/Backgrounds"
blur_dir="$HOME/.cache/blurred-walls"

mkdir -p "$blur_dir" "$cache_dir"

process_image() {
  local img_path="$1"
  [ ! -f "$img_path" ] && return

  local file_name=$(basename "$img_path")
  local blur_path="$blur_dir/$file_name"

  if [ ! -f "$blur_path" ]; then
    ffmpeg -loop 1 -i "$img_path" -vf "boxblur=64" -frames:v 1 -update 1 "$blur_path" -y -loglevel error
  fi
}

process_image "$1"
