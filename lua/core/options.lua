-- Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Mouse
vim.opt.mouse = "nv"

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- vim.opt.smartindent = true
vim.opt.autoindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Viewing
vim.opt.scrolloff = 12

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Terminal
vim.opt.termguicolors = true

-- Terminal windows: no whitespace markers or sign column (splits inherit the
-- global settings above; floating windows already turn these off)
vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("terminal-window", { clear = true }),
  callback = function(ev)
    if vim.bo[ev.buf].buftype == "terminal" then
      vim.opt_local.list = false
      vim.opt_local.signcolumn = "no"
    end
  end,
})

-- Decrease update time
vim.opt.updatetime = 300

-- Mapped sequence wait time
vim.opt.timeoutlen = 300

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Splits
vim.opt.splitright = true

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- vim.cmd("filetype plugin on")

-- Python indentation (built-in indenter): continuation lines get one shiftwidth
-- instead of two, and closing brackets go back to the start column
vim.g.python_indent = {
  open_paren = "shiftwidth()",
  nested_paren = "shiftwidth()",
  continue = "shiftwidth()",
  closed_paren_align_last_line = false,
}
