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

  use 'tjdevries/astronauta.nvim'

  use 'neovim/nvim-lspconfig'

  use 'williamboman/nvim-lsp-installer'

  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'

  use 'glepnir/lspsaga.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {
        active = true,
        on_config_done = nil,
        setup = {
          disable_netrw = true,
          hijack_netrw = true,
          open_on_setup = false,
          ignore_ft_on_setup = {
            'startify',
            'dashboard',
            'alpha',
          },
          update_to_buf_dir = {
            enable = true,
            auto_open = true,
          },
          auto_close = true,
          open_on_tab = false,
          hijack_cursor = false,
          update_cwd = false,
          diagnostics = {
            enable = true,
            icons = {
              hint = '',
              info = '',
              warning = '',
              error = '',
            },
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
          },
          system_open = {
            cmd = nil,
            args = {},
          },
          git = {
            enable = true,
            ignore = true,
            timeout = 200,
          },
          view = {
            width = 30,
            height = 30,
            side = 'left',
            auto_resize = true,
            number = false,
            relativenumber = false,
            mappings = {
              custom_only = false,
              list = {},
            },
          },
          filters = {
            dotfiles = false,
            custom = { '.git', 'node_modules', '.cache' },
          },
        },
        show_icons = {
          git = 1,
          folders = 1,
          files = 1,
          folder_arrows = 1,
          tree_width = 30,
        },
        quit_on_open = 0,
        git_hl = 1,
        disable_window_picker = 0,
        root_folder_modifier = ':t',
        icons = {
          default = '',
          symlink = '',
          git = {
            unstaged = '',
            staged = 'S',
            unmerged = '',
            renamed = '➜',
            deleted = '',
            untracked = 'U',
            ignored = '◌',
          },
          folder = {
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
          },
        },
      }
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'left',
            },
          },
        },
      }
    end,
  }

  use 'vim-airline/vim-airline'

  use 'dracula/vim'

  use 'svermeulen/vim-cutlass'

  use 'airblade/vim-gitgutter'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'jiangmiao/auto-pairs'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
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
      require('which-key').setup {}
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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
