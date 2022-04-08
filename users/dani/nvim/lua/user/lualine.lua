local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

-- Statusline setup
lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {
			{
			'filename',
			file_status = true,
			path = 1
			}
	},
    lualine_x = {'filetype'},
    lualine_y = {'progress', 'os.date("!CronTime: %M %H %d %m %w", os.time())'},
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
  tabline = {},
  extensions = {}
}
