return {
  "neovim/nvim-lspconfig",
  events = { "InsertEnter" },
  dependencies = {
    -- Language manager
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",

    -- Autocompletion
    "hrsh7th/cmp-buffer",                  -- Required
    "hrsh7th/cmp-path",                    -- Required
    "hrsh7th/nvim-cmp",                    -- Required
    "hrsh7th/cmp-nvim-lsp",                -- Required
    "hrsh7th/cmp-nvim-lsp-signature-help", -- Required

    -- Snippets
    "L3MON4D3/LuaSnip",             -- Required
    "saadparwaiz1/cmp_luasnip",     -- Required
    "rafamadriz/friendly-snippets", -- Required

    "onsails/lspkind.nvim",         -- Optional
  },
  config = function()
    -- enable mason and configure icons
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "gopls",
        "lua_ls",
        "rust_analyzer",
        "tailwindcss",
        "html",
        "templ",
        "zls"
      },
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig")
          if server_name == "gopls" then
            lspconfig.gopls.setup({
              settings = {
                gopls = {
                  gofumpt = true,
                },
              },
            })
          elseif server_name == "lua_ls" then
            lspconfig.lua_ls.setup({
              settigns = {
                Lua = {
                  diagnostic = {
                    globals = {
                      "vim",
                    },
                  },
                },
              },
            })
          elseif server_name == "ts_ls" then
            lspconfig.ts_ls.setup({
              filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
            })
          elseif server_name == "tailwindcss" then
            lspconfig.tailwindcss.setup({
              filetypes = { "templ", "html", "go" },
              settings = {
                tailwindCSS = {
                  includeLanguages = {
                    templ = "html",
                    go = "html"
                  },
                  experimental = {
                    classRegex = {
                      { "Class\\(([^)]*)\\)",   "[\"`]([^\"`]*)[\"`]" },
                      { "ClassX\\(([^)]*)\\)",  "[\"`]([^\"`]*)[\"`]" },
                      { "ClassIf\\(([^)]*)\\)", "[\"`]([^\"`]*)[\"`]" },
                      { "Classes\\(([^)]*)\\)", "[\"`]([^\"`]*)[\"`]" }
                    }
                  }
                },
              },
            })
          elseif server_name == "sourcekit" then
            lspconfig.sourcekit.setup({
              cmd = { '~/swift/usr/bin/sourcekit-lsp' }
            })
          elseif server_name == "ols" then
            lspconfig.ols.setup({})
          else
            require("lspconfig")[server_name].setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
          end
        end,
      },
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    local luasnip = require("luasnip")

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-space>"] = cmp.mapping.confirm({ select = true }),
      ["<C-y>"] = cmp.mapping.complete(),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<Tab>"] = cmp.mapping(function (fallback)
        if luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function (fallback)
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    local lspkind = require("lspkind")
    local lspconfig = require("lspconfig")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp_mappings,
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
        { name = 'path' }
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          preset = "codicons",
          mode = "symbol_text",  -- show only symbol annotations
          maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        }),
      },
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "gi", function()
          vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>rf", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>rr", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set({ "n", "x", "v" }, "<leader>ff", function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, opts)
      end,
    })

    local _border = "single"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = _border,
      style = "minimal",
      source = "always",
      silent = true,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = _border,
      style = "minimal",
      source = "always",
      silent = true,
    })

    local servers = {
      clangd = {},
      sourcekit = {
        root_dir = lspconfig.util.root_pattern(
          '.git',
          'Package.swift',
          'compile_commands.json'
        ),
      },
      lspconfig.rust_analyzer.setup {}
    }

    for server, setup in pairs(servers) do
      setup.handlers = vim.lsp.handlers
      lspconfig[server].setup(setup)
    end

    vim.diagnostic.config({
      float = {
        border = _border,
        style = "minimal",
        source = "always",
        header = "",
        prefix = "",
      },
      underline = true,
      virtual_text = {
        prefix = "",
        severity = nil,
        source = "if_many",
        format = nil,
      },
      signs = true,
      update_in_insert = false,
    })
  end,
}
