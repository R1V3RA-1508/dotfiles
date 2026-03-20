if status is-interactive
    # Commands to run in interactive sessions can go here
end

uwufetch

alias tailwindcss='pnpx @tailwindcss/cli'
alias gc='git commit'
alias gp='git push'
alias clocks='tclock -c "#CBA6F7"'
alias create-vite-app='pnpm create vite@latest'
alias cargo-run-with-debug='env RUST_LOG=debug cargo run'

function launchSilent
    nohup $argv >/dev/null &
end

sh ~/.cache/wal/colors.fish
