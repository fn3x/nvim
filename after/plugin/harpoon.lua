local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  },
  settings = {
    save_on_toggle = true,
  },
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-j>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-k>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-l>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-;>", function()
  harpoon:list():select(4)
end)
