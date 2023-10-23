return {
    'ttbug/tig.nvim',
    config = function ()
        local tig = require("tig")
        tig.setup()

        local keymap = vim.keymap

        keymap.set("n", "T", tig.open, { noremap = true })
    end
}
