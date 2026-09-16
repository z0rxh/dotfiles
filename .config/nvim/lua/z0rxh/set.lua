vim.api.nvim_set_hl(0, "NormalCursor", {
  fg = "#000000",
  bg = "#f7de3a",
})

vim.api.nvim_set_hl(0, "InsertCursor", {
  fg = "#000000",
  bg = "#ff0000",
})

-- vim.opt.guicursor = {
--   "n-v-c:block-NormalCursor",
--   "i-ci:block-NormalCursor",
--   "r-cr:block-NormalCursor",
--   "o:block-NormalCursor",
-- }

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.wrap = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable auto comment on new line",
})
