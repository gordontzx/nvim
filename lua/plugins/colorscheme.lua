-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   opts = {
--     style = "storm",
--   },
--   config = function()
--     vim.cmd.colorscheme "tokyonight"
--   end
-- }

-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("solarized-osaka").setup({
--       transparent = false,
--     })
--
--     vim.cmd[[colorscheme solarized-osaka]]
--   end,
-- }

-- return {
--   "navarasu/onedark.nvim",
--   version = "v0.1.0", -- Pin to legacy version
--   priority = 1000,
--   config = function()
--     require('onedark').setup {
--       style = 'deep'
--     }
--     require('onedark').load()
--   end
-- }

-- return {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('nordic').load()
--     end
-- }

-- return {
--   'sainnhe/sonokai',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.sonokai_enable_italic = true
--     vim.g.sonokai_style = 'andromeda'
--     vim.cmd.colorscheme('sonokai')
--   end
-- }

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    })

    require("kanagawa").load("wave")
  end,
}

-- return {
--   "edeneast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('duskfox')
--   end,
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--     })
--     vim.cmd.colorscheme "catppuccin-nvim"
--   end
-- }
