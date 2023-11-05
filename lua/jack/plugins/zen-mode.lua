return {
    "folke/zen-mode.nvim",
    config = function ()
        local keymap = vim.keymap

        keymap.set('n', '<leader>z', ":ZenMode<cr>", { noremap = true })
    end,
}
