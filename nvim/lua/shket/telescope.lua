local telescope = require("telescope")
local actions = require("telescope.actions")
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local IGNORE_FILE = os.getenv("HOME") .. "/.config/nvim/etc/telescope-ignore.txt"

local cmd_telescope = "<Cmd>lua require('telescope.builtin')"

keymap("n", "<Space>f", cmd_telescope .. ".find_files()<CR>", opts)
keymap("n", "<Space>g", cmd_telescope .. ".live_grep()<CR>", opts)
keymap("n", "<Space>j", cmd_telescope .. ".buffers()<CR>", opts)
keymap("n", "<Space>th", cmd_telescope .. ".help_tags()<CR>", opts)
-- keymap("n", "<Space>j", cmd_telescope .. ".jumplist()<CR>", opts)

telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            height = 0.8,
            -- preview_cutoff = 120,
            -- prompt_position = "bottom",
            prompt_position = "top",
            width = 0.8,
            preview_width = 0.6
        },

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close
            }
        },
        vimgrep_arguments = {
            "rg",
            "--vimgrep",
            "--smart-case",
            "--trim",
            "--hidden",
            "--no-ignore",
            "--ignore-file",
            IGNORE_FILE
        }
    },
    pickers = {
        find_files = {
            find_command = {
                "fdfind",
                "--type=f",
                "--strip-cwd-prefix",
                "--hidden",
                "--no-ignore",
                "--ignore-file",
                IGNORE_FILE
            }
        },
        buffers = {sort_lastused = true, sort_mru = true},
        lsp_references = {
            include_declaration = false,
            show_line = false
        },
        -- jumplist = {show_line = false}
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        }
        -- media_files = {
        -- 	-- filetypes whitelist
        -- 	-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        -- 	filetypes = { "png", "webp", "jpg", "jpeg" },
        -- 	find_cmd = "rg", -- find command (defaults to `fd`)
        -- },
    }
})

telescope.load_extension("fzf")
-- telescope.load_extension("media_files")
