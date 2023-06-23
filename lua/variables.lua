local sysname = vim.loop.os_uname().sysname
if sysname == 'Darwin' then
   vim.o.undodir = '/Users/nithe/.config/nvim/undo'
else
   vim.o.undodir = '/home/nithe/.config/nvim/undo'
end
vim.o.undofile = true
