vim.g.mapleader = " "

-- Move selected text
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")

-- Clear highlights on search when pressing <Esc>/<C-c> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

-- yank to clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Word deletion
vim.keymap.set("i", "<C-BS>", "<C-w>")

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Leave terminal mode (built-in <C-\><C-n> is blocked by toggleterm's <C-\> mapping)
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float .<CR>", { desc = "Open working directory (Oil)" })

-- Fix Ctrl-c not showing diagnostics
vim.keymap.set("i", "<C-c>", function()
  vim.cmd("stopinsert")
  -- vim.diagnostic.enable(true)
end)

-- Set <C-c> to do the same thing as <ESC>
-- vim.keymap.set("i", "<C-c>", "<Esc>")
