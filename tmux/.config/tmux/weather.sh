#!/usr/bin/env sh
# ~/.config/tmux/weather.sh

# If you want to have a specific location, you can set LOCATION variable with your IP or location exactly. We use your IP network for default.
LOCATION=""

f=/tmp/.tmux_weather
max_age=900

now=$(date +%s)
mtime=$(date -r "$f" +%s 2>/dev/null || echo 0)

if [ ! -s "$f" ] || [ $((now - mtime)) -gt $max_age ]; then
    if [ -n "$LOCATION" ]; then
        # target="wttr.in/${LOCATION}?format=3"
	target="wttr.in/${LOCATION}?format=%c+%t"
    else
	# target="wttr.in/?format=3"
        target="wttr.in/?format=%c+%t"
    fi
    # If you want to show your location name
    # t=$(curl -sf --max-time 3 "$target" | tr -d '+')
    t=$(curl -sf --max-time 3 "$target" | sed 's/^[a-zA-Z]*: //; s/+//g')
    [ -n "$t" ] && printf '%s' "$t" > "$f"
fi

cat "$f" 2>/dev/null || printf 'N/A'
