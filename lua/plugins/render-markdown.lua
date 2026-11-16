return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    { "<leader>mr", "<cmd>RenderMarkdown buf_toggle<cr>", ft = "markdown", desc = "Markdown: toggle render (buffer)" },
    { "<leader>mp", "<cmd>RenderMarkdown preview<cr>", ft = "markdown", desc = "Markdown: side preview" },
  },
}
