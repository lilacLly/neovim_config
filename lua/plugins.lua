require("packer").init({
	git = {
		default_url_format = "git@github.com:%s",
	},
})

require("keymapping")
require("configs")
require("lsp")
require("lsp/cmp")
require("lsp/ui")
require("lsp/null_ls")

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("lifepillar/vim-solarized8")
	use("shaunsingh/solarized.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use("simrat39/symbols-outline.nvim")
	use("dstein64/vim-startuptime")
	use({
		"akinsho/bufferline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"moll/vim-bbye",
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use("arkav/lualine-lsp-progress")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-treesitter/nvim-treesitter")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end)
