#/bin/bash

if [[ -n "$WAYLAND_DISPLAY" ]]; then
    if systemctl --user -q is-active swayidle; then
        systemctl --user -q stop swayidle
    else
        systemctl --user -q start swayidle
    fi
    echo "swayidle is $(systemctl --user is-active swayidle)"
else
    if xset q | grep -qF "DPMS is Enabled"; then
        xset -dpms s off
    else

        xset +dpms s default
    fi
    xset dpms q
fi
