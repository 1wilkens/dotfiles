#!/usr/bin/env osascript

tell app "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
