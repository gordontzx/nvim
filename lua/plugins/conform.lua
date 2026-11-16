-- Global Prettier defaults, used only when a project has no config of its own.
-- Two files because prettierd can't apply `overrides` from its default config.
local two_space_ft = { html = true, json = true, jsonc = true }
local function prettier_config(ctx)
  local name = two_space_ft[vim.bo[ctx.buf].filetype] and "prettierrc-2space.json" or "prettierrc.json"
  return vim.fn.expand("~/.config/prettier/" .. name)
end
local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = {
        "ruff_fix", -- fix auto-fixable lint errors
        "ruff_organize_imports", -- sort imports
        "ruff_format", -- format (replaces Black)
      },
      rust = { "rustfmt" },
      -- prettierd (daemon, fast) with plain prettier as a fallback
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      html = prettier,
      css = prettier,
      json = prettier,
      jsonc = prettier,
    },
    formatters = {
      prettierd = {
        env = function(_, ctx)
          return { PRETTIERD_DEFAULT_CONFIG = prettier_config(ctx) }
        end,
      },
      prettier = {
        -- `--config` overrides project lookup, so only pass it when the project has none
        prepend_args = function(_, ctx)
          local has_project_config = vim.fs.root(ctx.dirname, {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yaml",
            ".prettierrc.yml",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
          })
          return has_project_config and {} or { "--config", prettier_config(ctx) }
        end,
      },
    },
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
