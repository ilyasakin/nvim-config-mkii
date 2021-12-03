local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'tjdevries/astronauta.nvim' }

  use 'neovim/nvim-lspconfig'

  use 'williamboman/nvim-lsp-installer'

  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'

  use { 'glepnir/lspsaga.nvim' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.nvim-tree').setup()
      require('config.nvim-tree').post()
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.bufferline').setup()
    end,
  }

  -- use 'vim-airline/vim-airline'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('config.lualine').setup()
    end,
  }

  use 'dracula/vim'

  use {
    'svermeulen/vim-cutlass',
    config = function()
      require('config.cutlass').post()
    end,
  }

  use 'airblade/vim-gitgutter'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indentline').post()
    end,
  }

  use 'jiangmiao/auto-pairs'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('config.telescope').post()
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').config {}
      require('lspconfig')['null-ls'].setup {}
    end,
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  }

  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    require = { 'neovim/nvim-lspconfig', 'jose-elias-alvarez/null-ls.nvim' },
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('config.which-key').setup()
    end,
  }

  use { 'akinsho/toggleterm.nvim' }

  use {
    'tveskag/nvim-blame-line',
    config = function()
      vim.cmd [[
        autocmd BufEnter * EnableBlameLine
      ]]
    end,
  }

  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('config.dashboard-nvim').post()
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
