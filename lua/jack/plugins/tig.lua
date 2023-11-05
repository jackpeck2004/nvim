return {
    'codeindulgence/vim-tig',
    config = function ()
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }

        opts.desc = "Open Tig"
        keymap.set("n", "T", "<cmd>Tig<CR>", opts)
    end
}
