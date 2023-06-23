
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
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
   requires = { {'nvim-lua/plenary.nvim'} }
}
use {'neoclide/coc.nvim', branch = 'release'}
use 'preservim/nerdcommenter'
use 'francoiscabrol/ranger.vim'
use {'rust-lang/rust.vim', branch = 'master'}
use 'mbbill/undotree'
use 'timonv/vim-cargo'
use 'voldikss/vim-floaterm'
use 'elzr/vim-json'
use 'lambdalisue/nerdfont.vim'
use 'mg979/vim-visual-multi'
use 'Einenlum/yaml-revealer'

if packer_bootstrap then
    require('packer').sync()
  end
end)
