local M = {}

function M.find_files()
    require('telescope.builtin').find_files {
        prompt_title = 'Notes',
        cwd = '/home/nithe/.config/nvim/notes'
    }
end

function M.search_notes()
    require('telescope.builtin').live_grep {
        prompt_title = 'Grep note',
        cwd = '/home/nithe/.config/nvim/notes'
    }
end

return M
