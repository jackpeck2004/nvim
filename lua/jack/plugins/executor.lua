return {
    "google/executor.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    config = function ()
        local keymap = vim.keymap

        keymap.set('n', '<leader>er', ":ExecutorRun<CR>", {})
        keymap.set('n', '<leader>ev', ":ExecutorToggleDetail<CR>", {})
    end
}
