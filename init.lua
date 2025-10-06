vim.opt.number = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.tabstop = 2 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.autoread = true -- Auto-reads files changed externally when you focus Neovim
vim.opt.updatetime = 100 -- Faster cursor hold events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
  desc = "Check for file changes"
})
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  command = "silent! !",
  desc = "Trigger file system check"
})
vim.g.netrw_liststyle = 3
vim.cmd('cabbrev E Explore')

vim.keymap.set('n', '<F9>', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)

require("config.lazy")
require("config.lsp")
require("config.format")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
