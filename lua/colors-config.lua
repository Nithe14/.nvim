--Custom theme
vim.cmd('syntax enable')

--Fix colorscheme colors error
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme iceberg-based")
vim.cmd("highlight Normal ctermbg=NONE")
vim.cmd("highlight nonText ctermbg=NONE")


--This configs fix colors in the floating windows
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#181825"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="#181825"})
