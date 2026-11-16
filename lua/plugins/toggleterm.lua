return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- no open_mapping: both keys are defined below so they can pick the layout
    shade_terminals = true,
    float_opts = {
      border = "curved",
    },
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor(vim.o.lines * 0.2)
      end
    end,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- One shared terminal that can be shown floating or docked at the bottom
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new({ direction = "float", hidden = true })

    -- Same key again: hide it. Other key while open: move it to that layout.
    local function show(direction)
      if term:is_open() then
        term:close()
        if term.direction == direction then
          return
        end
      end
      term:open(nil, direction)
    end

    vim.keymap.set({ "n", "i", "t" }, [[<C-\>]], function()
      show("float")
    end, { desc = "Terminal (float)" })
    vim.keymap.set({ "n", "i", "t" }, [[<C-S-\>]], function()
      show("horizontal")
    end, { desc = "Terminal (bottom)" })
  end,
}
