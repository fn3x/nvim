return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ensure_installed = { "javascript", "typescript", "lua", "rust", "go", "zig", "html", "templ" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["gj"] = "@function.outer",
            ["]]"] = "@class.outer",
            ["]b"] = "@block.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["gJ"] = "@function.outer",
            ["]["] = "@class.outer",
            ["]B"] = "@block.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["gk"] = "@function.outer",
            ["[["] = "@class.outer",
            ["[b"] = "@block.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["gK"] = "@function.outer",
            ["[]"] = "@class.outer",
            ["[B"] = "@block.outer",
            ["[A"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.outer",   -- no inner for comment
            ["aa"] = "@parameter.outer", -- parameter -> argument
            ["ia"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
