vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.updatetime = 1000

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,i:blinkwait500-blinkoff400-blinkon500-Cursor/lCursor"

-- Colorscheme options --
vim.o.termguicolors = true
vim.opt.mouse = ""

vim.opt.undodir = "/home/fn3x/.config/.undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "120"

vim.opt.splitright = true

vim.opt.wildmenu = false
vim.opt.wildmode = ""
vim.g.pumheight = 5

vim.o.termguicolors = true

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

-- change to false for formatting on saving
vim.g.disable_autoformat = true
vim.g.loaded_node_provider = 0
