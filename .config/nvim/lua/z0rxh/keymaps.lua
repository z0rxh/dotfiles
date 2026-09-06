vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
-- without plugins vim.keymap.set('n', '<C-b>', ':Lexplore<CR>', { desc = 'Toggle left file explorer' })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })
