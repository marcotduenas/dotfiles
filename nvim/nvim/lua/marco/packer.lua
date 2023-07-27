-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	use { "ellisonleao/gruvbox.nvim" }

	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use {'nvim-orgmode/orgmode', config = function()
		require('orgmode').setup{}
	end
}

use {"akinsho/org-bullets.nvim", config = function()
	require("org-bullets").setup {
		-- Symbols for different headline bullet levels
		symbols = { "◉", "○", "✸", "✿" }
		-- Can also be overridden with a function to append to the above defaults
		symbols = function(default_list)
			table.insert(default_list, "♥")
			return default_list
		end,
		-- Show the literal text of the current line, similar to 'concealcursor'
		show_current_line = false,
		-- Whether or not to indent bullets
		indent = true,
		-- Characters that will match for bullets, can also be a function similar to 'symbols'
		-- but is passed a string instead of a table
		bullet_chars = "-+*",
		-- The symbol for the above bullets
		bullet_symbol = "•",
	}
end}


end)
