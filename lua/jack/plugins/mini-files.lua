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
        keymap.set('n', '<leader>pv', function ()
            local bufname = vim.api.nvim_buf_get_name(0)
            local dir = vim.fn.fnamemodify(bufname, ":h")
            MiniFiles.open(dir)
        end, opts)
    end
}
