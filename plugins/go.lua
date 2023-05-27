local utils = require "astronvim.utils"

return {
  {
  "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.codespell,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.code_actions.gitsigns,
    }
    return config -- return final config table
  end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = { "gomodifytags", "gofumpt", "iferr", "impl", "goimports", "codespell", "staticcheck", "golangci-lint" }
    end,
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    ft = "go",
    opts = {},
  },
}
