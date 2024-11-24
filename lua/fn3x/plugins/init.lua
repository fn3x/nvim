return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_menu_selection_background = "aqua"
      vim.g.gruvbox_material_visual = "blue background"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#b8fcec', bold = false })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#fcd6a9', bold = false })
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
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
    lazy = false,
    config = function ()
      require("refactoring").setup()
    end
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
  },
}
