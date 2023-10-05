require("onesearch").setup{
    flash_t = 150,                         -- how long flash lasts upon landing, set to 0 for no flash
    scrolloff = 5,                         -- margin to leave above top match while tabbing around
    hl = {
        overlay = "Comment",      	   -- highlight for the background during search
        multi = "OnesearchMulti",          -- highlight for multiple matches
        single = "OnesearchSingle",        -- highlight for single match
        select = "OnesearchRed",           -- highlight for hints during target selection
        flash = "OnesearchFlash",          -- highlight for landing flash
        error = "OnesearchRed",            -- highlight for no-matches flash
        current_char = "OnesearchCurrent", -- highlight for char to be chosen from pair
        other_char = "OnesearchOther",     -- highlight for other char in the pair
        prompt_empty = "OnesearchYellow",  -- highlight for prompt upon empty search pattern
        prompt_matches = "OnesearchGreen", -- highlight for default prompt
        prompt_nomatch = "OnesearchRed",   -- highlight for non-matching prompt
    },
    prompt = ">>> Search: ",               -- prompt header
    hints = { "a", "s", "d", "f", "h", "j", "k", "l", "w", "e", "r", "u", "i", "o", "x", "c", "n", "m" }
}
vim.keymap.set("n", "/", ":lua require('onesearch').search()<CR>")
vim.keymap.set({ "o", "n" }, "<leader>/", ":lua require('onesearch').search(io.popen(\"xclip -o\", \"r\"):read(\"*a\"))<CR>")
vim.keymap.set({ "v" }, "/", ":<C-u>lua require('onesearch').visual_search()<CR>")
vim.keymap.set({ "o", "n" }, "#", "ve:<C-u>lua require('onesearch').visual_search()<CR>")
