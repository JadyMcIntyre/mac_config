--- ---- --- --- --- --- --- ---
--- Config file for Packer ---
--- ---- --- --- --- --- --- ---

--- Load Packer
vim.cmd [[packadd packer.nvim]]

--- Packer Stuff (Package Manager)
return require('packer').startup(function(use)
	--- Packer (Self managed)
	use 'wbthomason/packer.nvim'

	--- Telescope (Fuzzy Search)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--- Dracula (Theme)
	use ({'Mofiqul/dracula.nvim'})

	--- Treesitter (Syntax highlighting etc...)
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	--- Undotree (Gives history of changes)
	use('mbbill/undotree')

	--- LSP stuff (Autocompletion and IDE kind've stuff)
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})

	-- Twilight ( Code zen mode)
	use({'folke/twilight.nvim'})

	-- Autopairs (add surrounding bracket)
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}
	--- --- --- --- --- --- --- --- 
	-- ---  Stuff For Coding --- --
	--- --- --- --- --- --- --- --- 


	--- --- --- --- --- --- --- --- 
	--- Dart Stuff Experimental ---
	--- --- --- --- --- --- --- --- 

	-- Dart Specific Snippets
	use({'natebosch/dartlang-snippets'})

	 

	-- Dart
	use({'dart-lang/dart-vim-plugin'})

end)
