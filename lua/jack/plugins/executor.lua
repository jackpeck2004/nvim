return {
    "google/executor.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    opts = {},
    config = function ()
        local keymap = vim.keymap

        keymap.set('n', '<leader>er', ":ExecutorRun<CR>", {})
        keymap.set('n', '<leader>ev', ":ExecutorToggleDetail<CR>", {})
    end
}
