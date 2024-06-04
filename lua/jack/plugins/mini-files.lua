return {
    'echasnovski/mini.files',
    version = false,
    config = function ()
        require("mini.files").setup({
            windows = {
                preview = true
            }
        })

        local keymap = vim.keymap


        local opts = { noremap = true, silent = true }
        opts.desc = "Open file explorer"
        keymap.set('n', '<leader>pv', MiniFiles.open, opts)
    end
}
