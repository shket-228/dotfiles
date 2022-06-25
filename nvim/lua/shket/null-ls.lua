local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({
            -- formatting.prettierd.with({
            -- env = {
            --     PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
            -- },
            extra_args = { "--tab-width", "4" },
        }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.djhtml,
        -- formatting.sqlfluff.with({
        --     extra_args = { "--dialect", "postgres" },
        -- }),
    },
})

