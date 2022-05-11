local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- Отображет позицию курсора и общее количество строк ( 70/2034:0 )
local function my_location()
	local r,c        = unpack(vim.api.nvim_win_get_cursor(0))
	local total_rows = vim.api.nvim_buf_line_count(0)
	return string.format("%+3s/%s:%-2s", r, total_rows, c);
end

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'solarized_dark',
    theme = 'auto',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    },
      'filesize',
		},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {
			-- 'location', 
			my_location }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
