vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
-- without plugins vim.keymap.set('n', '<C-b>', ':Lexplore<CR>', { desc = 'Toggle left file explorer' })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

vim.keymap.set('n', '<C-k>', 'gcc', { remap = true, desc = "Comment line" })
vim.keymap.set('v', '<C-k>', 'gc', { remap = true, desc = "Comment the selection" })
