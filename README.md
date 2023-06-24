## About
I recently switched from vim (using vimscript) to neovim (using lua), so I decided to publish my new config. This is not final version of course. My goal is to improve my configuration and keep it the same accross two systems: macos and arch. 
This is one day version of having fun with configuration. 

## TL;DR
Run this commands to install my configs:
```bash
#Maby backup your current config first ;)
$ git clone https://github.com/Nithe14/.nvim.git ~/.config/nvim
$ sed -i "s/nithe/$USER/g" ~/.config/nvim/lua/variables.lua
```
The config is ready! This is time to install all plugins. Run this commands in nvim:
```vim
:PackerInstall
:PackerSync
```
Everything should be set up :)

## Keybindings
The most important keybind is as always leader. For me it is a `,` char. It's pretty handy, don't you think?

`<leader>w` - save current buffer.

`<leader>q` - Close the buffer. If there is more buffers open only the current would be closed.

`<leader>1q` - Force to close. Close all buffers, do not save files and do not warning about it.

`<leader>tt` - Trigger floating terminal.

`<leader>ff` - Trigger floating fuzzy file finder - telescope.

`<leader>fg` - Trigger floating live grep - telescope.

`<leader>fb` - Trigger floating buffers selector - telescope.

`<leader>fl` - Trigger floating fuzzy line finder - telescope.

`<leader>fgc` - Trigger floating git commits selector - telescope.

`<leader>fgb` - Trigger floating git branches selector - telescope.

`<leader>fcs` - Trigger flaoting colorscheme selector - telescope.

`<leader>y` - Toggle undo tree.

`<leader>r` - Open ranger in the current path.

`<leader>c<Space>` - Comment/uncomment selected lines. In normal mode comment/uncomment current line.

`<C-up/down>` - Trigger multi cursor.

`<C-h/j/k/l>` - Switch focus to left/down/up/right window.
## Completion
This config uses coc (https://github.com/neoclide/coc.nvim). So the code completion is very powerful and simple to use. Just find your favorite language coc server and install it from vim command. Exmaple:
```vim
:CocInstall coc-rust-analyzer
```
## Other features
NeoVim can keep all changes you made in a single dir. I set it to ~/.config/nvim/undo. So you can undo and redo changes in any file even if you close it.

## Styles
There is a lualine with some theme, and iceberg colorscheme (https://github.com/cocopon/iceberg.vim) but you probably change it so whatever.

_That's it for now..._
