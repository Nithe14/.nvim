## Table of Contents
1. [About](#about)
2. [Requirements](#requirements)
3. [Install](#install)
4. [Keybindings](#keybindings)
5. [Completion](#completion)
6. [Other features](#other-features)

## About 
This is my NeoVim config using lua and Pakcer as a plugin manager.  Not a final version of course. My goal is to improve my configuration and keep it the same accross two systems: macos and arch. 

There is a lualine with some theme, and iceberg-based colorscheme (https://github.com/cocopon/iceberg.vim) with my background but you probably change it so whatever.

It looks like this:
![preview](./assets/styles.png)
## Requirements
- nvim >= 0.9.1
- nodejs
- npm
- gcc
- nerd-fonts (recommended)

## Install
Run this commands to install my config:
```bash
#Maybe backup your current config first ;)
$ git clone https://github.com/Nithe14/.nvim.git ~/.config/nvim
$ cd ~/.config/nvim
$ bash install.sh
```
Everything should be set up :)

Open `nvim` and run `:PackerStatus` to see what have been installed.

## Keybindings
The most important keybind is as always leader. For me it is a `,` char. It's pretty handy, don't you think?

#### Basic
| Mapping  |      Action   |
|----------|:-------------:|
| `<leader>w` |  Save current buffer |
| `<leader>q` |  Close the buffer. If there is more buffers open only the current will be closed. |
| `<leader>1q` | Force to close. Close all buffers, do not save them and do not warning about it.|
| `<leader>tt` | Trigger floating terminal |
|`<leader>gg`| Trigger floating gitui |
|`<leader>c<Space>` | Comment/uncomment selected lines. In normal mode comment/uncomment current line. |
|`<leader>l` | Toggle twilight (focus mode) |
|`<leader>s` | Toggle shade (dim unselected tabs)|
|`<leader>i` | Trigger [ toggler ](https://github.com/nguyenvukhang/nvim-toggler) action |
|`<M-Up/Down>` | Shade brightness up/down |
|`<leader><cr>` | Clear all selected matching |
| `<C-h/j/k/l>` | Switch focus to left/down/up/right window |
|`<C-up/down>` | Trigger multi cursor. |


**There is an error with the shade plugin. Coc HintFloat windows doesn't appear if shade is enabled. I'm working on it, but for now, if there is a hint sign (">>") in the left column, I disable the shade plugin with the `<leader>s` binding.**
#### Telescope 

| Mapping  |      Action   |
|----------|:-------------:|
| `<leader>ff` | Trigger floating fuzzy file finder. (Now you can switch between telescopes menu with tabulator)|
|`<leader>fgr` | Trigger floating live grep. | 
|`<leader>fb` | Trigger floating buffers selector. |
|`<leader>fl` | Trigger floating fuzzy line finder. |
|`<leader>fm` | Trigger floating old files (mru) finder. |
|`<leader>ft` | Trigger floating file type selector. |
|`<leader>ftt` | Trigger floating treesitter (funcs, variable, structs finder). |
|`<leader>fcs` | Trigger floating colorscheme selector. |
|`<leader>fgc` | Trigger floating git commits selector. |
|`<leader>fgb` | Trigger floating git branches selector. |
| `<leader>y` | Trigger floating undo history |
| `<leader>fs` | Trigger floating ssh connection selector |

#### Coc
| Mapping | Action |
|---------|:-------|
| `<leader>cfr` | Use coc-prettier to format the code (need coc-prettier to be installed `:CocInstall coc-prettier`) |


#### Remote
**Now you can connect to the remote host using [distant](https://github.com/chipsenkbeil/distant.nvim) and edit files remotly!**
| Mapping | Action |
|----------|:-------------:|
| `<leader>d` | Open connection info |
| `<leader>o` | Open remote file director in user home path |

#### Notes
I keep my notes using [arachne](https://github.com/oem/arachne.nvim) in the single directory ($HOME/.config/nvim/notes)
| Mapping  | Action  |
|----------|:-------:|
|`<leader>nn`| Create new note |
|`<leader>fn` | Find notes by telescope |
| `<leader>fgn` | Grep from notes by telescope |
| `<leader>nr` | Rename current note |

#### Plugin manager
| Mapping  |    Action     |
|----------|:-------------:|
|`<leader>PI`| Install all plugins with Packer|
| `<leader>PS`| Sync/Upgrade all plugins with Packer|

#### File manager
| Mapping  |      Action   |
|----------|:-------------:|
|`<leader>rr` | Open ranger in the current path. |

#### Move
| Mapping  |      Action   |
|----------|:-------------:|
|`<M-j>` | Move line/visual block down |
|`<M-k>` | Move line/visual block up |
|`<M-l>` | Move char/visual block left |
|`<M-h>` | Move char/visual block right |

## Completion 
This config uses [coc](https://github.com/neoclide/coc.nvim). So the code completion is very powerful and simple to use. Just find your favorite language coc server and install it from vim command. Exmaple:
```vim
:CocInstall coc-rust-analyzer
```
## Other features 
- NeoVim can keep all changes you made in a single dir. I set it to ~/.config/nvim/undo. So you can undo and redo changes in any file even if you close it.
- Now you can connect to the remote host using [distant](https://github.com/chipsenkbeil/distant.nvim) and edit files remotly! Just press `<leader>fs` to open telescope based on your~/.ssh/config. 

_That's it for now..._
