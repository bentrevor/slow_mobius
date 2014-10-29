tell application "System Preferences"
    activate
    -- focusing on the datetime preferences pane forces the clock to reset
    -- when "Set date and time automatically" is enabled
    set current pane to pane id "com.apple.preference.datetime"
    quit
end tell