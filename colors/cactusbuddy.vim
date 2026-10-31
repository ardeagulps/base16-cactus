" make :colorscheme reload
lua package.loaded.cactusbuddy = nil
lua package.loaded.statusline = nil
lua require('cactusbuddy')
lua require('statusline')
