
vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'solargraph',
  'eslint',
  'sumneko_lua',
})

-- keymaps to add only on buffers with LSP support (overriding grep/tags based defaults)
local lsp_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufmap = function(mode, lhs, rhs, dsc)
    vim.keymap.set(mode, lhs, rhs, { desc = dsc , buffer = 0, remap = false })
  end
  bufmap("n", "gd", vim.lsp.buf.definition,      '[g]o to [d]efinition (LSP)')
  bufmap("n", "gD", vim.lsp.buf.declaration,     '[g]o to [D]eclaration (LSP)')
  bufmap("n", "gr", vim.lsp.buf.references,      '[g]o to [R]eferences (LSP)')
  bufmap("n", "gi", vim.lsp.buf.implementation,  '[g]o to [i]mplementation (LSP)')
  bufmap("n", "K",  vim.lsp.buf.hover,           '[K] Hover info (LSP)')
  bufmap("n", "R",  vim.lsp.buf.rename,          '[R]ename symbol (LSP)')
  bufmap("v", "<leader>=", ':LspZeroFormat<CR>', '[=] Reformat (LSP)')
end

-- Set up lspconfig.
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['solargraph'].setup{ on_attach = lsp_attach, capabilities = lsp_capabilities }
require('lspconfig')['html'].setup{ on_attach = lsp_attach, capabilities = lsp_capabilities }
require('lspconfig')['cssls'].setup{ on_attach = lsp_attach, capabilities = lsp_capabilities }
require('lspconfig')['tsserver'].setup{ on_attach = lsp_attach, capabilities = lsp_capabilities }
require('lspconfig')['eslint'].setup{ on_attach = lsp_attach, capabilities = lsp_capabilities }
require('lspconfig')['sumneko_lua'].setup{
  capabilities = lsp_capabilities,
  on_attach = lsp_attach,
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
}

-- install lua-language-server from binary release:
-- mkdir -p ~/src/lua-language-server
-- cd ~/src/lua-language-server
-- wget https://github.com/sumneko/lua-language-server/releases/download/3.6.7/lua-language-server-3.6.7-linux-x64.tar.gz
-- tar -xzf lua-language-server-3.6.7-linux-x64.tar.gz
-- on $PATH
-- #!/bin/bash
-- exec "<path-to-directory>/bin/lua-language-server" "$@"

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
