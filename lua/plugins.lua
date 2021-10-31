local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("tjdevries/astronauta.nvim")

	use("neovim/nvim-lspconfig")

	use("williamboman/nvim-lsp-installer")

	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-nvim-lsp")

	use("saadparwaiz1/cmp_luasnip")

	use("L3MON4D3/LuaSnip")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				auto_close = true,
			})
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
		end,
	})

	use("vim-airline/vim-airline")

	use("dracula/vim")

	use("airblade/vim-gitgutter")

	use("lukas-reineke/indent-blankline.nvim")

	use("jiangmiao/auto-pairs")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").config({})
			require("lspconfig")["null-ls"].setup({})
		end,
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
