-- stylua: ignore
local parsers = {
  "bash", "c", "cpp", "arduino", "lua", "python", "rust", "go", "java",
  "html", "css", "javascript", "typescript", "tsx", "json",
  "markdown", "markdown_inline", "vim", "vimdoc", "query",
  "toml", "yaml", "make", "cmake", "gitcommit", "diff",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
      callback = function(ev)
        -- leave LaTeX to vimtex
        if ev.match == "tex" then
          return
        end
        -- no-op (regex syntax stays) when there's no parser for this filetype
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
