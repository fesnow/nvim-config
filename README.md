# Neovim Configuration

Personal Neovim configuration using [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Open Neovim - plugins will be installed automatically:
   ```bash
   nvim
   ```

## Structure

```
.
├── init.lua                 # Main entry point
├── lua/
│   ├── config/             # Core configuration modules
│   │   ├── lazy.lua        # Lazy.nvim setup
│   │   ├── lsp.lua         # LSP configuration
│   │   └── format.lua      # Formatter configuration
│   └── plugins/            # Plugin specifications
│       ├── spec.lua        # Core plugins (cmp, treesitter, etc.)
│       ├── lsp.lua         # LSP plugins (Mason, lspconfig)
│       ├── formatter.lua   # Conform.nvim
│       ├── linter.lua      # nvim-lint
│       ├── telescope.lua   # Fuzzy finder
│       ├── copilot.lua     # GitHub Copilot
│       ├── avante.lua      # AI assistant
│       └── dap.lua         # Debug adapter
└── lazy-lock.json          # Plugin version lock file
```

## Key Features

- **Plugin Management**: Lazy.nvim with lazy loading
- **LSP**: Mason for server management, configured for TypeScript
- **Formatting**: Conform.nvim with Prettier (format on save)
- **Completion**: nvim-cmp with LSP integration and LuaSnip
- **AI Assistants**: GitHub Copilot and Avante
- **Debugging**: nvim-dap with UI extensions


## Commands

- `:Lazy` - Open Lazy.nvim plugin manager
- `:Lazy sync` - Update plugins
- `:Mason` - Manage LSP servers
- `:checkhealth` - Check configuration health

## Notes

- The `pack/` directory is gitignored as it contains managed plugin dependencies
- Plugin versions are locked in `lazy-lock.json` for reproducibility
- LSP servers are auto-installed via Mason on first run
