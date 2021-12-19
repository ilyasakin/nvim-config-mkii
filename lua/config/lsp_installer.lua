local lsp_utils = require 'lspconfig.util'

local M = {}

M.setup = function()
  local lsp_installer = require 'nvim-lsp-installer'
  local lsp_installer_servers = require 'nvim-lsp-installer.servers'

  local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
      silent = true,
    })
  end

  local on_attach = function(_, bufnr)
    local wk = require 'which-key'
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    wk.register({
      g = {
        D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
      },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      g = {
        d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
      },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      b = {
        R = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
      },
    }, { buffer = bufnr, noremap = true, prefix = '<leader>' })

    wk.register(
      {
        b = {
          r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'References' },
        },
      },
      { buffer = bufnr, noremap = true, prefix = '<leader>' }
    )

    wk.register({
      c = {
        a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      },
    }, { buffer = bufnr, noremap = true, prefix = '<leader>' })

    wk.register({
      c = {
        a = {
          '<cmd>lua vim.lsp.buf.range_code_action()<CR>',
          'Range Code Action',
        },
      },
    }, { mode = 'v', buffer = bufnr, noremap = true, prefix = '<leader>' })

    wk.register({
      ['['] = {
        d = {
          '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
          'Go to previous diagnostic',
        },
      },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      [']'] = {
        d = {
          '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
          'Go to next diagnostic',
        },
      },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      f = {
        f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' },
      },
    }, { buffer = bufnr, noremap = true })

    wk.register({
      f = {
        f = { '<cmd>lua vim.lsp.buf.range_formatting()<CR>', 'Range Format' },
      },
    }, { mode = 'v', buffer = bufnr, noremap = true })

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end

  local ensure_installed = {
    'tsserver',
    'sumneko_lua',
    'rust_analyzer',
    'pylsp',
    'html',
    'graphql',
    'vuels',
    'jsonls',
    'clangd',
    'bashls',
    'cssls',
    'yamlls',
    'gopls',
    'diagnosticls',
    'cmake',
    'dockerls',
    'sqlls',
    'prismals',
    'vimls',
    'eslint',
  }

  for _, server in ipairs(ensure_installed) do
    local _, requested_server = lsp_installer_servers.get_server(server)

    if not requested_server:is_installed() then
      -- Queue the server to be installed
      requested_server:install()
    end
  end

  lsp_installer.on_server_ready(function(server)
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    if server.name == 'sumneko_lua' then
      opts.settings = {
        Lua = {
          completion = {
            showWord = 'Disable',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    end

    if server.name == 'tsserver' then
      opts.init_options = require('nvim-lsp-ts-utils').init_options
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require 'nvim-lsp-ts-utils'

        ts_utils.setup {}

        ts_utils.setup_client(client)
        buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
        buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
        buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
        on_attach(client, bufnr)
      end

      opts.root_dir = function(fname)
        return lsp_utils.root_pattern 'tsconfig.json'(fname)
          or lsp_utils.root_pattern(
            'package.json',
            'jsconfig.json',
            '.git'
          )(fname)
          or lsp_utils.path.dirname(fname)
      end
    end

    if server.name == 'angularls' then
      opts.filetypes = { 'html' }
    end

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
  end)
end

return M
