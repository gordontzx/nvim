return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright", -- types, hover, go-to-definition (ruff only lints/formats)
        -- "basedpyright",
        -- "superhtml",
        "html",
        "cssls",
        "ts_ls",
        "emmet_language_server",
      },
      -- stylua is installed for conform; don't also run it as a language server
      automatic_enable = { exclude = { "stylua" } },
    },
  },
  {
    -- Installs the non-LSP tools (formatters) that conform.lua relies on
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "stylua", -- lua
        "ruff", -- python
        "prettierd", -- js/ts/html/css/json
        "prettier", -- fallback for prettierd
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "saghen/blink.cmp" },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- Show LSP document colors (e.g. CSS hex codes) as a swatch before the value
      -- instead of highlighting the text. Styles: "background" (default), "foreground", "virtual"
      vim.lsp.document_color.enable(true, nil, { style = "virtual" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(ev)
          vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto Definition" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = ev.buf, desc = "Diagnostic float" })
        end,
      })
    end,
  },
}
