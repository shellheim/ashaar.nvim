# ashaar.nvim

This is a little neovim plugin I wrote, inspired by [fortune](https://github.com/BlakeJC94/alpha-nvim-fortune) though this is specifically designed for couplets.

A single couplet in urdu is called a `sher` while a collection of them is called `ash'aar`.

This plugin is a collection of urdu couplets (displayed in the roman script) for [alpha-nvim.](https://github.com/goolord/alpha-nvim) On startup, it chooses from a list of authors and then chooses a couplet from that author. All of the couplets are in the external file `ashaar_list.lua` in an extensible format :

```lua
local ashaar = {
    Shakespeare = {
        "For sweetest things turn sourest by their deeds : Lilies that fester, smell far worse than weeds."
    }
}
 --Obviously the collection is of urdu poets and the couplets are in urdu.
```

The couplet 'syntax' is just `<line1><space>:<space><line2>`. Like `To be or not to be : That is the question.`

## Quick Start

### Lazy

Go to wherever you have configured `alpha-nvim` and put ashaar as a dependency :

```lua
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'shellheim/ashaar.nvim',
  },

  config = function()
        ...
  end,
}
```

Now use this in your alpha-nvim config :

```lua
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'shellheim/ashaar.nvim',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

        -- Call ashaar
    local ashaar = require 'ashaar.ashaar'

    -- Set header
    dashboard.section.header.val = {
      '███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
      '███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
      '███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ',
      '███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ',
      ' ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ',
    }
    dashboard.section.buttons.val = {
      dashboard.button('n', ' > New File', '<cmd>ene<CR>'),
      dashboard.button('f', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('r', ' > Find Recent Files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('c', ' > Configuration', '<cmd>edit ~/.config/nvim/init.lua<CR>'),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }
        -- Give the returned couplet to alpha's footer
    dashboard.section.footer.val = ashaar()

    alpha.setup(dashboard.opts)
  end,
}

```
