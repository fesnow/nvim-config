-- LSP Setup
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "ts_ls" },
  automatic_installation = true,
})

-- Autocomplete Setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

-- LSP capabilities (connect to nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure tsserver
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false -- Prettier handles formatting
    client.server_capabilities.documentRangeFormattingProvider = false
    client.handlers["textDocument/publishDiagnostics"] = function(...) end -- disables ts_ls diagnostics
    
    -- LSP keymaps
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})
vim.lsp.enable('ts_ls')
