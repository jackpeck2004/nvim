-- Map leader to space
vim.g.mapleader = " "

-- Custom keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
