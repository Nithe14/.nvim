local home_directory = os.getenv("HOME")

require('arachne').setup {notes_directory = home_directory .. "/.config/nvim/notes"}
vim.keymap.set('n', '<leader>nn',
                    function() return require('arachne').new() end)
            vim.keymap.set('n', '<leader>nr',
                    function() return require('arachne').rename() end)
vim.keymap.set('n', '<leader>fn', ":lua require('plugins.custom.arachne-addons').find_files()<cr>")
vim.keymap.set('n', '<leader>fgn', ":lua require('plugins.custom.arachne-addons').search_notes()<cr>")
