-- init.lua
require('nvim-toggler').setup({
  -- your own inverses
  inverses = {
    ['let'] = 'let mut',
    ['white'] = 'black',
    ['0'] = '1'
  },
  -- removes the default <leader>i keymap
  remove_default_keybinds = false,
  -- removes the default set of inverses
  remove_default_inverses = false,
})
