-- Map leader to space
vim.g.mapleader = " "

-- Custom keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
