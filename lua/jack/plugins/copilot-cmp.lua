return {
    -- 'github/copilot.vim'
      "zbirenbaum/copilot-cmp",
      dependencies = {
          "hrsh7th/nvim-cmp",
      },
      config = function()
          require("copilot_cmp").setup()
      end,
}
