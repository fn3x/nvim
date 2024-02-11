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
vim.o.undodir = "/home/fn3x/.config/.undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.colorcolumn = "120"

vim.o.splitright = true

vim.o.wildmenu = false
vim.o.wildmode = ""
vim.g.pumheight = 5

vim.o.termguicolors = true

-- change to false for formatting on saving
vim.g.disable_autoformat = true
