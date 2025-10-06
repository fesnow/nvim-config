return {
  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Tailwind CSS LSP setup
      vim.lsp.config('tailwindcss', {
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte"
        },
        init_options = {
          userLanguages = {
            typescript = "javascript",
            typescriptreact = "javascript"
          }
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "className=\"([^\"]*)", 1 },
                { "className={`([^`]*)", 1 },
                { "className={'([^'}]*)", 1 },
              }
            }
          }
        }
      })
      vim.lsp.enable('tailwindcss')
    end
  },

  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "eslint",
          "tailwindcss",
          "lua_ls",
        },
      })
    end,
  },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
}
