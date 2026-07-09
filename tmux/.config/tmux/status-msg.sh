#!/usr/bin/env sh
# ~/.config/tmux/status-msg.sh
# Time-of-day greeting when the shell is idle. Silent while a command is
# running — the window tab already shows the command name, no need to repeat it.
# $1 = pane_current_command

cmd="$1"

case "$cmd" in
    bash|zsh|fish|sh|dash|tmux|"")
        ;;  # just a shell, show the greeting below
    *)
        exit 0
        ;;
esac

h=$(date +%H)
if [ "$h" -lt 5 ]; then
    printf '#[fg=#6c7086]Up too late? Bedtimee!'
elif [ "$h" -lt 12 ]; then
    printf '#[fg=#6c7086]Have a good new day!'
elif [ "$h" -lt 13 ]; then
    printf '#[fg=#6c7086]Lunch break time~'
elif [ "$h" -lt 18 ]; then
    printf '#[fg=#6c7086]Have a productive afternoon!'
else
    printf '#[fg=#6c7086]Good evening!'
fi
