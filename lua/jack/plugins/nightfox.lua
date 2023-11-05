-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--     config = function()
--         -- set the colorscheme
--         color = color or "rose-pine"
--         vim.cmd.colorscheme(color)
--
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
-- }
--
return {
    "EdenEast/nightfox.nvim",
    -- "luisiacc/gruvbox-baby",
    config = function()
        vim.cmd.colorscheme("nightfox")
        -- vim.cmd.colorscheme("gruvbox-baby")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
