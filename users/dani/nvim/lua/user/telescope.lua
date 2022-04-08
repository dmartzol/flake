local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = { enable = true }
}

-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
telescope.setup{
  defaults = {
      mappings = {
          i = {
            ["<CR>"] = "select_tab"
          }        
      }
  }
}

--require('telescope').load_extension('fzf')
telescope.load_extension('file_browser')

local mappings = {}

function mappings.buffer_git_files()
  require("telescope.builtin").git_files(themes.get_dropdown {
    cwd = vim.fn.expand "%:p:h",
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
end


mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return mappings
