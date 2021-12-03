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
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local options = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gD',
      '<cmd>lua vim.lsp.buf.declaration()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gd',
      '<cmd>lua vim.lsp.buf.definition()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'K',
      '<cmd>lua vim.lsp.buf.hover()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gi',
      '<cmd>lua vim.lsp.buf.implementation()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<C-k>',
      '<cmd>lua vim.lsp.buf.signature_help()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wa',
      '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wr',
      '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>D',
      '<cmd>lua vim.lsp.buf.type_definition()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>rn',
      '<cmd>lua vim.lsp.buf.rename()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gr',
      '<cmd>lua vim.lsp.buf.references()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>ca',
      '<cmd>lua vim.lsp.buf.code_action()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'v',
      '<leader>ca',
      '<cmd>lua vim.lsp.buf.range_code_action()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>e',
      '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '[d',
      '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      ']d',
      '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>q',
      '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>so',
      [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
      options
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'v',
      'f',
      [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]],
      options
    )
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
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require 'nvim-lsp-ts-utils'

        ts_utils.setup {
          eslint_bin = 'eslint_d',
          eslint_enable_diagnostics = true,
          eslint_enable_code_actions = true,
          enable_formatting = true,
          formatter = 'prettierd',
        }

        ts_utils.setup_client(client)
        buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
        buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
        buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
        on_attach(client, bufnr)
      end
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
