--local colorscheme = "one"
--vim.opt.background = "dark"                     -- the color scheme used in the selected theme

--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--if not status_ok then
  --vim.notify("colorscheme " .. colorscheme .. " not found!")
  --return
--end

local status_ok, onedark = pcall(require, 'onedark')
if status_ok then
    onedark.setup {
        -- Main options --
        style = 'light', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false,  -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden

        -- toggle theme style ---
        toggle_style_key = '<leader>sc', -- Default keybinding to toggle
        toggle_style_list = {'light', 'dark'}, -- List of styles to toggle between
    }
    onedark.load()
end
