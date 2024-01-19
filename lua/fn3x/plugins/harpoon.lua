return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
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
    vim.keymap.set("n", "<C-S-p>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-n>", function()
      harpoon:list():next()
    end)
  end,
}
