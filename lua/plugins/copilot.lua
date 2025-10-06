-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  -- Main Copilot plugin (Lua version)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Enter>",
            next = "<Tab>",
            prev = "<S-Tab>",
          }
        },
          panel = { enabled = true },
        })
    end,
  },

  -- Optional: Copilot completion source for nvim-cmp
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
