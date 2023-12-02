vim.g.maplocalleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.smartindent = false
vim.o.expandtab = true
vim.g.expandtab = true

vim.o.updatetime = 300

vim.o.termguicolors = true

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

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.o.colorcolumn = "120"

vim.o.splitright = true

if vim.g.neovide then
	vim.o.guifont = "Berkeley Mono Variable"
	vim.g.neovide_scale_factor = 1.2
	vim.g.neovide_transparency = 15.55
	vim.g.neovide_refresh_rate = 170
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_trail_size = 0.5
end
