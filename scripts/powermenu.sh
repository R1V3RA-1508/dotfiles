#!/usr/bin/env bash

shutdown_icon="$(printf '\uf011')"
reboot_icon="$(printf '\uf2f9')"
suspend_icon="$(printf '\uf186')"
logout_icon="$(printf '\uf08b')"

notify_err() {
  fyi -a "PowerMenu" -u critical "Error" "$1"
}

run_with_privs() {
  if command -v doas >/dev/null && doas -n true 2>/dev/null; then
    doas "$@"
  elif command -v sudo >/dev/null && sudo -n true 2>/dev/null; then
    sudo "$@"
  else
    "$@"
  fi
}

run_action() {
  if run_with_privs "$1" 2>/dev/null; then
    exit 0
  else
    notify_err "Failed to $2. Check permissions."
  fi
}

chosen="$(echo -e "$shutdown_icon\n$reboot_icon\n$suspend_icon\n$logout_icon" | rofi -dmenu -config "$HOME/.config/rofi/powermenu.rasi")"

case "$chosen" in
"$shutdown_icon")
  run_action "poweroff" "shutdown"
  ;;
"$reboot_icon")
  run_action "reboot" "reboot"
  ;;
"$suspend_icon")
  systemctl suspend
  ;;
"$logout_icon")
  niri msg action quit
  ;;
*)
  exit 0
  ;;
esac
