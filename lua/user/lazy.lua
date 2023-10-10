local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "wbthomason/packer.nvim",

    {
        "nvim-telescope/telescope.nvim", tag = "0.1.3",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
    },

    "google/vim-colorscheme-primary",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },

    "jwalton512/vim-blade",

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    "ttbug/tig.nvim",

    "gpanders/editorconfig.nvim",

    "terrortylor/nvim-comment",

    {
        "google/executor.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        }
    },
}, {
    defaults = { lazy = true },
})
