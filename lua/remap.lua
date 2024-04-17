local function map(mode, lhs, rhs, desc, opts)
  opts = opts or { noremap = true, silent = true }
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- filetree
map("n", "<leader>fp", vim.cmd.Ex, "View filetree")

map("v", "K", ":m '<-2<CR>gv=gv", "Move line up by 1 line and format it")
map("v", "J", ":m '>+1<CR>gv=gv", "Move line down by 1 line and format it")

map("i", "<Tab>", "<Esc>")

-- movement
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")
map("n", "n", "nzzzv", "Next occurence and center")
map("n", "N", "Nzzzv", "Previous occurence and center")

-- yank and paste
map("x", "<leader>p", '"_dP', "Replace without yanking")
map("n", "<leader>d", '"_d', "Delete without yanking")
map("n", "<leader>D", '"_D', "Delete until EOL without yanking")
map("n", "<leader>c", '"_c', "Change without yanking")
map("n", "<leader>C", '"_C', "Change until EOL without yanking")
map("n", "<leader>p", '"+p', "Paste after cursor from clipboard")
map("n", "<leader>P", '"+P', "Paste before cursor from clipboard")

-- map to save buffer
map("n", "<leader><leader>", "<cmd>:w<CR>", "Save file on <leader><leader>")
