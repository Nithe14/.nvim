vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true})
vim.wo.number = true
--vim.opt.autochdir = true
local hostname = vim.fn.hostname() or ''
local command = ':TablineTabRename ' .. "localhost (".. hostname ..")"
vim.api.nvim_exec(command, false)
