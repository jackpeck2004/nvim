local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'lua_ls'},
    handlers = {
      lsp_zero.default_setup,

    },
})

-- local cmp = require('cmp')
-- -- set completeopt=menu,menuone,noselect
-- local cmp_action = require('lsp-zero').cmp_action()
--
--
-- cmp.setup({
--     mapping = {
--             --[[ ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--             ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--             ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--             ['<C-y>'] = cmp.config.disable, -- remove the default `<C-y>` mapping
--             ['<C-e>'] = cmp.mapping({
--                 i = cmp.mapping.abort(),
--                 c = cmp.mapping.close(),
--             }),
--             ['<CR>'] = cmp.mapping.confirm({ select = true }), -- accept currently selected item ]]
--             ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
--             ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
--             ['<Tab>'] = cmp_action.tab_complete(),
--             ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
--         },
-- })
--

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
        return
    end-- import luasnip plugin safely

    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
        return
    end-- load VSCode-like snippets from plugins (e.g., friendly-snippets)

    require("luasnip/loaders/from_vscode").lazy_load()

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
        snippet = {
            expand = function(args)
            luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- LSP
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within the current buffer
            { name = "path" }, -- file system paths
        }),
})
