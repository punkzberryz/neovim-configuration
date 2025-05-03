return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")
    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Configure mason-lspconfig
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls", -- This is the correct lspconfig name
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        -- "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "gopls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })

    -- Configure mason-tool-installer
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js/ts linter
        "gopls", -- go language server
        "goimports", -- go imports formatter
        "golines", -- go formatter
        "typescript-language-server", -- ensure typescript server is installed
      },
    })
  end,
}
