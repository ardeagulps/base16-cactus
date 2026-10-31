# Cactusbuddy

A plain succulent 256-color theme using [mini.base16].

[mini.base16]: https://github.com/echasnovski/mini.base16

## Screenshots

### Rust

![cactusbuddy-rust](media/cactusbuddy-rust.png)

### JavaScript

![cactusbuddy-javascript](media/cactusbuddy-javascript.png)

### Tig

![cactusbuddy-tig](media/cactusbuddy-tig.png)

Tig configuration for the theme can be found in [the gist][tigrc].

[tigrc]: https://gist.github.com/redbug312/8a6541ddedf087c1e851d5b8ae07048d

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'redbug312/cactusbuddy',
  lazy = false,
  priority = 1000,
  dependencies = {
    'echasnovski/mini.base16',
    'echasnovski/mini.statusline', -- Optional: if you want statusline support
  },
  config = function()
    vim.cmd('colorscheme cactusbuddy')
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'redbug312/cactusbuddy',
  requires = {
    'echasnovski/mini.base16',
    'echasnovski/mini.statusline', -- Optional: if you want statusline support
  },
  config = function()
    vim.cmd('colorscheme cactusbuddy')
  end,
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'echasnovski/mini.base16'
Plug 'echasnovski/mini.statusline' " Optional: if you want statusline support
Plug 'redbug312/cactusbuddy'

" After plug#end()
colorscheme cactusbuddy
```

## Use with [mini.statusline]

[mini.statusline]: https://github.com/echasnovski/mini.statusline

To get the statusline shown in the screenshots, make sure `mini.statusline` is installed. It will be configured and initialized automatically when the colorscheme is loaded.

