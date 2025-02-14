return {
  -- Other plugin specifications
  {
    "otavioschwanck/tmux-awesome-manager.nvim",
    config = function()
      require("tmux-awesome-manager").setup({
        -- Your configuration options here
        commands = {
            {
              name = "RunMyCommand",
              cmd = "python %",
              key = "<leader>a",
              orientation = "v", -- 'v' for vertical split, 'h' for horizontal
              reuse = "existing", -- Reuse existing pane if available
            },
          },
      })
    end,
  },
  -- Other plugin specifications
}
