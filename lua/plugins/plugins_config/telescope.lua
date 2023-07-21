require('telescope').setup {
  defaults = {
    file_icons = true,
    file_icon_colors = true,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = "move_selection_next",
	["<C-k>"] = "move_selection_previous"
      }
    }
  },
  extensions = {
        undo = {
        mappings = {
            i = {
              ["<s-cr>"] = require("telescope-undo.actions").yank_additions,
              ["<c-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<cr>"] = require("telescope-undo.actions").restore
            },
        },
      },
  }
}
local builtin = require('telescope.builtin')
local undo = require('telescope').extensions.undo.undo
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fm', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ft', builtin.filetypes, {})
vim.keymap.set('n', '<leader>ftt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fcs', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>y', undo, {})
