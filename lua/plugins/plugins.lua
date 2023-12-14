
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
   requires = { 'nvim-lua/plenary.nvim', "debugloop/telescope-undo.nvim" }
}
use {'neoclide/coc.nvim', branch = 'release'}
use 'preservim/nerdcommenter'
use {'rust-lang/rust.vim', branch = 'master'}
--use 'timonv/vim-cargo'
use 'elzr/vim-json'
use 'lambdalisue/nerdfont.vim'
use 'mg979/vim-visual-multi'
use 'Einenlum/yaml-revealer'
use 'nvim-tree/nvim-web-devicons'
use 'jiangmiao/auto-pairs'
use 'nvim-treesitter/nvim-treesitter'
use 'is0n/fm-nvim'
use 'sunjon/shade.nvim'
use 'folke/twilight.nvim'
use { "catppuccin/nvim", as = "catppuccin" }
--use {'Nithe14/onesearch.nvim'}
use 'lfrati/onesearch.nvim'
use "numToStr/FTerm.nvim"
use("petertriho/nvim-scrollbar")
use("lewis6991/gitsigns.nvim")
use { 'nguyenvukhang/nvim-toggler' }
use 'fedepujol/move.nvim'
use { 'm-demare/hlargs.nvim' }
use { "chrisgrieser/nvim-spider" }
use {'ThePrimeagen/vim-be-good'}
use {'nacro90/numb.nvim'}
use {'tomiis4/Hypersonic.nvim'}
use { 'oem/arachne.nvim' }
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
use {
  'kdheepak/tabline.nvim',
  config = function()
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  }
use {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
}
use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
        })
    end
})
use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
	    resize = {
        	enable_default_keybindings = false
		}
	}) end
})
use({
	'mvllow/modes.nvim',
	tag = 'v0.2.1',
})
if packer_bootstrap then
    require('packer').sync()
  end
end)
