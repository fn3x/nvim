return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
      },
    })

    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
    vim.keymap.set("n", "<C-g>", builtin.git_status, {})
    vim.keymap.set("n", "<C-H>", builtin.git_commits, {})
    vim.keymap.set("n", "<C-s>", builtin.grep_string, {})
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})

    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    vim.keymap.set("n", "<leader>;", function()
      builtin.resume()
    end)
  end,
}
