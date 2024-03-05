-- https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2

local M = {}

-- 1. mode (as in Vim modes like Normal/Insert mode) 
-- 2. lhs (the custom keybinds you need) 
-- 3. rhs (the commands or existing keybinds to customise) 
-- 4. opts (additional options like <silent>/<noremap>, see :h map-arguments for
-- more info on it)
--
-- By default, the opts parameter of the map() function is assigned to a table
-- { noremap = true }. In doing so, nested & recursive use of mappings are
-- allowed (refer to :h map-commands for more info on it). You can expand the
-- opts table further with additional map-arguments as you require. And at the
-- core of the wrapper is the vim.api.nvim_set_keymap() function which accepts
-- the list of parameters mentioned above.
--
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
