local lsp_installer = require 'nvim-lsp-installer'

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
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
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
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
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

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
  server:setup(opts)
end)
