local autosave = require("autosave")

autosave.setup(
    {
        enabled = false,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        --execution_message = "",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = true,   -- :wa after lsp rename
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

autosave.hook_after_on = function ()
	print("AutoSave ON")
end

autosave.hook_after_off = function ()
	print("AutoSave OFF")
end

local map = vim.api.nvim_set_keymap
map('n', '<space>S', ':ASToggle<CR>', {noremap = true, silent = false})
