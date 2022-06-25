local project_group = vim.api.nvim_create_augroup("project_specific", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = {"*/projects/*"},
    callback = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    --"migrations",
                    "cogito/design",
                },
            },
        })
    end,
    group = project_group,
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
