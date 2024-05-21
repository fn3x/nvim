return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  {
    "mbbill/undotree",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle },
    },
  },
  {
    "machakann/vim-sandwich",
    event = "InsertEnter",
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  }
}
