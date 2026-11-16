-- Update editor and neo-tree on changes to filesystem
vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
  pattern = { "*" },
})

-- Auto format on write
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end
-- })
