## DISCLAIMER
## i am now using NixOS (btw), so i won't be maintaining lua-version of my neovim config

# nvim
My neovim config containing configured packages like treesitter, lsp, telescope, harpoon, etc.

## Requirements
* gcc, clang, tar, curl (for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements))
* gcc or cmake (for [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation))

## Install steps
1. Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
3. Place this repository inside nvim config directory ```~/.config/nvim```
4. Change undo directory option ```vim.o.undodir``` to whatever you want it to be in [lua/options.lua](https://github.com/fn3x/nvim-config/blob/925eb740e1ab2c1f51fb34ce6ff6a52ac9e48d79/lua/options.lua#L22C28-L22C28)
5. Enjoy :)
