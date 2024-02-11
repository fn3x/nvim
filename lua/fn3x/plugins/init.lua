return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", ctermbg = "none", ctermfg = "none" })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
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
