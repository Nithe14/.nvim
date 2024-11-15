vim.cmd('syntax enable') 
vim.cmd('filetype plugin indent on')
--rustfmt is broken for macos
local sysname = vim.loop.os_uname().sysname
if sysname == 'Darwin' then
	vim.api.nvim_create_autocmd("BufWritePre", {
	    pattern = "*.rs",
	    callback = function()
	        vim.cmd("silent! write")
	        vim.cmd("silent! !cargo fmt")
	        vim.cmd("edit!")
	    end,
	})
else
	vim.g.rustfmt_autosave = 1
end
