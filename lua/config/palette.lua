local palettes = {
  matrix = {
    bg        = '#000000',
    bg_light  = '#0a0a0a',
    bg_subtle = '#001a00',
    bg_mid    = '#001400',
    bg_dim    = '#000f00',
    primary   = '#00ff41',
    primary_mid = '#33ff77',
    primary_dk  = '#00cc33',
    primary_dim = '#006622',
    primary_lt  = '#66ff99',
    accent    = '#66ff99',
    muted     = '#006622',
    red       = '#cc0000',
    red_bright = '#ff0000',
    orange    = '#ff6600',
    yellow    = '#ffff00',
    white     = '#ffffff',
    black     = '#000000',
    grey      = '#cccccc',
    grey_dk   = '#666666',
    grey_bg   = '#333333',
    bg_dark   = '#1a1a1a',
  },
  imperial = {
    bg        = '#000000',
    bg_light  = '#1a1a1a',
    bg_subtle = '#1a0000',
    bg_mid    = '#140000',
    bg_dim    = '#0f0000',
    primary   = '#ffffff',
    primary_mid = '#cccccc',
    primary_dk  = '#aaaaaa',
    primary_dim = '#666666',
    primary_lt  = '#ff6600',
    accent    = '#ff6600',
    muted     = '#666666',
    red       = '#cc0000',
    red_bright = '#ff0000',
    orange    = '#ff6600',
    yellow    = '#ffff00',
    white     = '#ffffff',
    black     = '#000000',
    grey      = '#cccccc',
    grey_dk   = '#666666',
    grey_bg   = '#333333',
    bg_dark   = '#1a1a1a',
  },
}

local M = {}

function M.get(name)
  return palettes[name] or palettes.matrix
end

return M
