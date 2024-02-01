require('move').setup({
	line = {
		enable = true, -- Enables line movement
		indent = true  -- Toggles indentation
	},
	block = {
		enable = true, -- Enables block movement
		indent = true  -- Toggles indentation
	},
	word = {
		enable = true, -- Enables word movement
	},
	char = {
		enable = false -- Enables char movement
	}
})
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<M-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<M-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<M-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<M-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<M-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<M-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<M-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<M-l>', ':MoveHBlock(1)<CR>', opts)
