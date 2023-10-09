return {
	"machakann/vim-sandwich",
	{
		"b0o/mapx.nvim",
		config = function()
			require("mapx").setup({ global = true })
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				theme = 'gruvbox-material',
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	"mbbill/undotree",
	"nvim-treesitter/nvim-treesitter-context",
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	"theprimeagen/harpoon",
	"tpope/vim-fugitive",
	"ThePrimeagen/vim-be-good",
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	"Eandrju/cellular-automaton.nvim",
	-- "github/copilot.vim",
	{
		"sainnhe/gruvbox-material",
		config = function() vim.cmd.colorscheme("gruvbox-material") end
	},
}
