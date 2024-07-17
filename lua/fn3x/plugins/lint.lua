return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      javascript = { "eslint_d", "eslint" },
      typescript = { "eslint_d", "eslint" },
      javascriptreact = { "eslint_d", "eslint" },
      typescriptreact = { "eslint_d", "eslint" },
    }

    local eslint = lint.linters.eslint_d

    eslint.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
