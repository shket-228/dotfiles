require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = false, disable = { "" } },
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = { enable = true },
})

-- require("colorizer").setup({
--     "css",
--     "javascript",
--     "html",
-- }, {
--     mode = "background",
--     css = true,
-- })
