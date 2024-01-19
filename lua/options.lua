vim.g.maplocalleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.updatetime = 300
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,i:blinkwait500-blinkoff400-blinkon500-Cursor/lCursor"

-- Colorscheme options --
vim.colorscheme = "gruvbox-material"
vim.o.termguicolors = true
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_bold = 0
vim.g.gruvbox_material_menu_selection_background = "aqua"
vim.g.gruvbox_material_visual = "blue background"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_float_style = "high"

vim.o.mouse = ""

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = "C://Users/Art/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.colorcolumn = "120"

vim.o.splitright = true

vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"

vim.g.loaded_node_provider = 0

if vim.g.neovide then
  vim.o.guifont = "Berkeley Mono Variable"
  vim.g.neovide_scale_factor = 1.2
  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_scroll_animation_far_lines = 0

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.95
  vim.g.transparency = 1
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_scroll_animation_length = 0
end
