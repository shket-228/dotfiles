local actions = require("telescope.actions")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<Space>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<Space>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<Space>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<Space>th", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			-- height = 0.9,
			-- preview_cutoff = 120,
			-- prompt_position = "bottom",
			-- width = 0.8,
			preview_width = 0.6,
		},

		file_ignore_patterns = {
			".git/",
			"node_modules/",
			".venv/",
			"__pycache__/",
			"__init__.py",
			"pyrightconfig.json",
			"static/libs/",
			"migrations/",
			"media/",
		},

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<Esc>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			-- n = {
			--     ["<esc>"] = actions.close,
			--     ["<CR>"] = actions.select_default,
			--     ["<C-x>"] = actions.select_horizontal,
			--     ["<C-v>"] = actions.select_vertical,
			--     ["<C-t>"] = actions.select_tab,
			--
			--     ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
			--     ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			--     ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			--     ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			--
			--     ["j"] = actions.move_selection_next,
			--     ["k"] = actions.move_selection_previous,
			--     ["H"] = actions.move_to_top,
			--     ["M"] = actions.move_to_middle,
			--     ["L"] = actions.move_to_bottom,
			--
			--     ["<Down>"] = actions.move_selection_next,
			--     ["<Up>"] = actions.move_selection_previous,
			--     ["gg"] = actions.move_to_top,
			--     ["G"] = actions.move_to_bottom,
			--
			--     ["<C-u>"] = actions.preview_scrolling_up,
			--     ["<C-d>"] = actions.preview_scrolling_down,
			--
			--     ["<PageUp>"] = actions.results_scrolling_up,
			--     ["<PageDown>"] = actions.results_scrolling_down,
			--
			--     ["?"] = actions.which_key,
			-- },
		},
		vimgrep_arguments = {
			"rg",
			"--vimgrep",
			"--smart-case",
			"--trim",
			"--hidden",
			"--no-ignore",
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		find_files = {
			find_command = {
				"fdfind",
				"--type=f",
				"--strip-cwd-prefix",
				"--hidden",
				"--no-ignore",
			},
			-- find_command = { "fd", "--hidden", "--no-ignore", "--type", "f", "--strip-cwd-prefix" },
		},
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	-- You dont need to set any of these options. These are the default ones. Only
	-- the loading is important
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		-- media_files = {
		-- 	-- filetypes whitelist
		-- 	-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		-- 	filetypes = { "png", "webp", "jpg", "jpeg" },
		-- 	find_cmd = "rg", -- find command (defaults to `fd`)
		-- },
	},
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
-- require("telescope").load_extension("media_files")
