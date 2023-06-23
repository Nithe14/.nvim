function CheckBackspace()
  local col = vim.fn.col('.') - 1
  local line = vim.fn.line('.')
  local char = vim.fn.getline(line):sub(col, col)
  return col == 0 or char:match('%s') ~= nil
end

vim.api.nvim_set_keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { silent = true, expr = true })

vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><Right><c-r>=coc#on_enter()<CR>"', { silent = true, expr = true })

vim.api.nvim_set_keymap('n', 'K', ':call ShowDocumentation()<CR>', { silent = true })

function ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', true)
  end
end

vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { silent = true, expr = true })

