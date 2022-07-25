require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {enable = true},
    indent = {enable = true, disable = {"python", "css"}},
    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
            node_incremental = "an", -- increment to the upper named parent
            node_decremental = "in" -- decrement to the previous node
            -- scope_incremental = "as", -- increment to the upper scope (as defined in locals.scm),
        }
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist

            goto_next_start = {["]f"] = "@function.outer", ["]c"] = "@class.outer"},
            goto_next_end = {["]F"] = "@function.outer", ["]C"] = "@class.outer"},
            goto_previous_start = {["[f"] = "@function.outer", ["[c"] = "@class.outer"},
            goto_previous_end = {["[F"] = "@function.outer", ["[C"] = "@class.outer"}
        },

        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            -- lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    }
    -- rainbow = {
    --     enable = true,
    --     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    --     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --     max_file_lines = nil -- Do not enable for files with more than n lines, int
    --     -- colors = {}, -- table of hex strings
    --     -- termcolors = {} -- table of colour name strings
    -- }
})

-- require("colorizer").setup({
--     "css",
--     "javascript",
--     "html",
-- }, {
--     mode = "background",
--     css = true,
-- })
