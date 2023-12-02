require('luasnip.loaders.from_vscode').lazy_load()

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'gopls',
  'lua_ls',
  'rust_analyzer'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-space>'] = cmp.mapping.confirm({ select = true }),
  ['<C-y>'] = cmp.mapping.complete(),
  ['<C-f>'] = cmp_action.luasnip_jump_forward(),
  ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local lspkind = require('lspkind')

lsp.setup_nvim_cmp({
  handlers = handlers,
  mapping = cmp_mappings,
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      preset = 'codicons',
      mode = 'symbol_text',  -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set({ 'n', 'x', 'v' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
end)

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

lsp.setup({ handlers = handlers })

vim.diagnostic.config({
  virtual_text = true
})
