return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "clangd",
          "pyright",
          "rust_analyzer",
          "biome",
          "html",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        "lua_ls",
        "tsserver",
        "clangd",
        "pyright",
        "rust_analyzer",
        "biome",
        "html",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
