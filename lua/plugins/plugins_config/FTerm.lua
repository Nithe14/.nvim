require'FTerm'.setup({
    border = 'rounded',
    dimensions  = {
        height = 0.85,
        width = 0.85,
    },
})
local fterm = require("FTerm")

local gitui = fterm:new({
    cmd = "gitui",
})

vim.keymap.set('n', '<leader>gg', function()
    gitui:toggle()
end)

vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
