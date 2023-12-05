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
