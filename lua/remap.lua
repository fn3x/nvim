-- local discipline = require('craftzdog.discipline')
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- key mappings
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- map jk to escape
keymap.set("i", "jk", "<ESC>")

keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- map to clean all buffers except the current one
keymap.set("n", "<leader>bd", "<cmd>%bd|e#<CR>")

-- map to save buffer
keymap.set("n", "<leader><leader>", "<cmd>:w<CR>")

-- map to quit buffer/window
keymap.set("n", "<leader>q", "<cmd>:q<CR>")
