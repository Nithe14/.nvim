local function my_diagnostics()
    return {
        error = ' ',
        warn = ' ',
        info = ' ',
        hint = ' ',
    }
end
--I know it is neovim but I like ths clasic icon very much
local function vimek()
      return [[]]
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin-macchiato',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {vimek, 'mode'},
    lualine_b = {'branch', 'diff', { 
    		'diagnostics', 
            	symbols = my_diagnostics() }	
		},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {},
      lualine_b = {'filename'},
      lualine_c = {},
      lualine_x = {require'tabline'.tabline_tabs},
      lualine_y = {},
      lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
