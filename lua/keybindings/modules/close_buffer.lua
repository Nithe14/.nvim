local function close_buffer()
  local buffer_count = vim.api.nvim_buf_call(0, function()
    return vim.api.nvim_call_function('bufnr', {'%'})
  end)

  if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == '' or buffer_count == 1 then
    vim.cmd('q')
  else
    vim.cmd('bd')
  end
end

 return {
   close_buffer = close_buffer
 }


