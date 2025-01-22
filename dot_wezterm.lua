-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 13
-- config.font = wezterm.font_with_wallback {}


-- Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'powershell.exe', '-NoLogo' }
--[[
  table.insert(config.launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in
    ipairs(
      wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
    )
  do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(config.launch_menu, {
      label = 'x64 Native Tools VS ' .. year,
      args = {
        'cmd.exe',
        '/k',
        'C:/Program Files (x86)/'
          .. vsvers
          .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
      },
    })
  end
]]--
end

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Moon'

-- and finally, return the configuration to wezterm
return config
