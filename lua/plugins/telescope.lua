-- plugins/telescope.lua

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
              ["<Esc>"] = actions.close,
            },
            n = {
              ["<C-h>"] = "which_key",
            },
          },
          layout_config = {
            vertical = { width = 0.5 },
            horizontal = { width = 0.9 },
          },
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            -- previewer = false, -- REMOVE this line
          },
          buffers = {
            theme = "dropdown",
            -- previewer = false, -- REMOVE this line
          },
        },
        extensions = {
          -- fzf = { ... },
        },
      })

      -- pcall(telescope.load_extension, "fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })
    end,
  },
}
