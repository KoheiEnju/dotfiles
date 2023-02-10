-- Must be located at $HOME/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm'
local act = wezterm.action

return {
    use_img = true,
    -- Appearance
    font = wezterm.font 'HackGen35 Console NF',
    color_scheme = "nord",
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = 'Right' } },
            mods = 'NONE',
            action = wezterm.action.Paste,
        },
    },
    keys = {

        { key = '%', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { key = '"', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, },
        { key = '7', mods = 'CTRL', action = act.PaneSelect },
        { key = 't', mods = 'SHIFT|ALT', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = '{', mods = 'ALT', action = act.ActivateTabRelative(-1) },
        { key = '}', mods = 'ALT', action = act.ActivateTabRelative(1) },
    },
    window_decorations = "RESIZE",
}
