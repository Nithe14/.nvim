require'FTerm'.setup({
    border = 'rounded',
    dimensions  = {
        height = 0.85,
        width = 0.85,
    },
})

vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
