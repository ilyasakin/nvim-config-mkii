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

return require('packer').startup {
  function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'tjdevries/astronauta.nvim' }

    use { 'dstein64/nvim-scrollview' }

    use {
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
      config = function()
        require('nvim-ts-autotag').setup()
      end,
    }

    use { 'p00f/nvim-ts-rainbow' }

    use {
      'nacro90/numb.nvim',
      config = function()
        require('numb').setup {}
      end,
    }

    use {
      'kosayoda/nvim-lightbulb',
      config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
      end,
    }

    use {
      'NTBBloodbath/doom-one.nvim',
      config = function()
        require('doom-one').setup {
          cursor_coloring = false,
          terminal_colors = false,
          italic_comments = false,
          enable_treesitter = true,
          transparent_background = false,
          pumblend = {
            enable = true,
            transparency_amount = 20,
          },
          plugins_integrations = {
            neorg = false,
            barbar = false,
            bufferline = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            neogit = true,
            nvim_tree = false,
            dashboard = true,
            startify = false,
            whichkey = true,
            indent_blankline = true,
            vim_illuminate = false,
            lspsaga = true,
          },
        }
      end,
    }

    use {
      'neovim/nvim-lspconfig',
      config = function()
        local lsp = require 'config.lsp'
        lsp.post()
      end,
    }

    use {
      'williamboman/nvim-lsp-installer',
      after = 'nvim-lspconfig',
      config = function()
        local lsp_installer = require 'config.lsp_installer'
        lsp_installer.setup()
      end,
    }

    use {
      'ms-jpq/chadtree',
      branch = 'chad',
      config = function()
        local chadtree = require 'config.chadtree'
        chadtree.setup()
      end,
    }

    use {
      'ms-jpq/coq_nvim',
      branch = 'coq',
      config = function()
        local coq = require 'config.coq'
        coq.setup()
      end,
    }

    use {
      'ms-jpq/coq.artifacts',
      branch = 'artifacts',
      after = 'coq_nvim',
    }

    use {
      'ms-jpq/coq.thirdparty',
      branch = '3p',
      after = 'coq_nvim',
    }

    use {
      'glepnir/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
        local lspsaga = require 'config.lspsaga'
        lspsaga.post()
      end,
    }

    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        local bufferline = require 'config.bufferline'
        bufferline.setup()
      end,
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        local lualine = require 'config.lualine'
        lualine.setup()
      end,
    }

    use {
      'svermeulen/vim-cutlass',
      config = function()
        local cutlass = require 'config.cutlass'
        cutlass.post()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('gitsigns').setup()
      end,
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        local indentline = require 'config.indentline'
        indentline.post()
      end,
    }

    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
      end,
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        local treesitter = require 'config.treesitter'
        treesitter.setup()
        treesitter.post()
      end,
      run = ':TSUpdate',
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        local telescope = require 'config.telescope'
        telescope.post()
      end,
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local null_ls = require 'config.null-ls'
        null_ls.setup()
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
        local which_key = require 'config.which-key'
        which_key.setup()
        which_key.post()
      end,
    }

    use {
      'akinsho/toggleterm.nvim',
      config = function()
        local toggleterm = require 'config.toggleterm'
        toggleterm.setup()
        toggleterm.post()
      end,
    }

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
        local dashboard = require 'config.dashboard-nvim'
        dashboard.post()
      end,
    }

    use {
      'mfussenegger/nvim-dap',
      config = function()
        local dap = require 'config.dap'
        dap.post()
      end,
    }

    use {
      'Pocco81/DAPInstall.nvim',
      requires = 'mfussenegger/nvim-dap',
      config = function()
        local dap_install = require 'config.dap_install'
        dap_install.setup()
      end,
    }

    use {
      'AckslD/nvim-neoclip.lua',
      requires = {
        { 'tami5/sqlite.lua', module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
      },
      config = function()
        local neoclip = require 'config.neoclip'
        neoclip.setup()
        neoclip.post()
      end,
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}
