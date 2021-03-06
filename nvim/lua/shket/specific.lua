local project_group = vim.api.nvim_create_augroup("project_specific", {clear = true})
local opt = vim.opt

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = {"*/avegabug/client*"},
    callback = function()
        opt.tabstop = 2
        opt.softtabstop = 2
        opt.shiftwidth = 2
    end,
    group = project_group
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = {"*.ipynb"},
--     callback = function()
--         vim.bo.filetype = "python"
--         vim.opt["number"] = false
--         vim.opt["relativenumber"] = false
--     end,
--     group = project_group,
-- })
