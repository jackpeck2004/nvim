return {
 "nosduco/remote-sshfs.nvim",
 dependencies = { "nvim-telescope/telescope.nvim" },
 -- opts = {
 --     connections = {
 --         ssh_configs = {
 --           vim.fn.expand "$HOME" .. "/.ssh/config",
 --         }
 --     }
 -- },
 -- config = function()
 --     local api = require('remote-sshfs.api')
 --     vim.keymap.set('n', '<leader>rc', api.connect, {})
 --     vim.keymap.set('n', '<leader>rd', api.disconnect, {})
 --     vim.keymap.set('n', '<leader>re', api.edit, {})
 -- end
}
