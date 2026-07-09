source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
# Input method (fcitx5) — export on login shells.
# Use -gx (session global) instead of -Ux so it stays reproducible and
# doesn't rely on persisted universal vars in fish_variables.
if status is-login
    set -gx GTK_IM_MODULE fcitx
    set -gx QT_IM_MODULE fcitx
    set -gx XMODIFIERS @im=fcitx
    set -gx SDL_IM_MODULE fcitx
    set -gx GLFW_IM_MODULE ibus
end
