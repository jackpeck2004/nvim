local lsp = require('lsp-zero')
--
lsp.preset('recommended')
lsp.setup()
-- 
-- lsp.ensure_installed({
--     'tsserver',
--     'eslint',
--     'sumneko_lua',
--     'gopls'
-- })
-- 
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
-- 
lsp.on_attach(function(_, bufnr)
    local noremap = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
    bind('n', 'Q', function() print('Hello') end, {buffer = bufnr, desc = 'Say hello'})
-- more code  ...
end)

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").tsserver.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").gopls.setup {}
