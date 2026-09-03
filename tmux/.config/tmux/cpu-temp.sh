#!/usr/bin/env sh

# Print an optional CPU-temperature suffix for the tmux status line.
# Prefer the package/control sensor, then fall back to the average core value.
command -v sensors >/dev/null 2>&1 || exit 0

LC_ALL=C sensors 2>/dev/null | awk '
function number(value) {
    gsub(/[^0-9.+-]/, "", value)
    return value + 0
}

/^[[:space:]]*Tctl:/ && !have_control {
    control = number($2)
    have_control = 1
}

/^[[:space:]]*Package id 0:/ && !have_package {
    package = number($4)
    have_package = 1
}

/^[[:space:]]*Core [0-9]+:/ {
    cores += number($3)
    core_count++
}

END {
    if (have_control)
        temperature = control
    else if (have_package)
        temperature = package
    else if (core_count)
        temperature = cores / core_count
    else
        exit

    printf " / %.0f°C", temperature
}
'
