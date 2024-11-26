-- Map leader to space
vim.g.mapleader = " "

-- Custom keybindings
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
local opts = { noremap = true, silent = true }

opts.desc = "Create new tab"
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew, opts)

opts.desc = "Switch to next tab"
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext, opts)

opts.desc = "Switch to previous tab"
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprev, opts)

opts.desc = "Open diagnostic"
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

opts.desc = "Format JSON"
vim.keymap.set("n", "<leader>fj", function()
    if vim.bo.filetype == "json" or vim.bo.filetype == "jsonc" then
        vim.cmd(":%!jq .")
    else
        print("Not a JSON file")
    end
end, opts)
