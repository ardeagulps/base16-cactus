" make :colorscheme reload
lua package.loaded['base16-cactus'] = nil
lua package.loaded.statusline = nil
lua require('base16-cactus')
lua require('statusline')
