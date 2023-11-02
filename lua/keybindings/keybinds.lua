vim.g.mapleader = ","
vim.keymap.set('n', '<leader>w', ':w<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>1q', ':q!<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':lua require("keybindings.modules.close_buffer").close_buffer()<CR>', { noremap = true, silent = true  })
vim.keymap.set('n', '<leader><cr>', ':nohlsearch<cr>', {})
vim.api.nvim_set_keymap('n', ';;', 'A;<ESC>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>vmd', ':MarkdownPreview<cr>', {})
