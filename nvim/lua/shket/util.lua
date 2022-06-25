function _G.reload_nvim_conf()
	for name, _ in pairs(package.loaded) do
		if name:match("^shket") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

local keymap = vim.api.nvim_set_keymap
keymap("n", "<Space>R", "<cmd>lua reload_nvim_conf()<CR>", { noremap = true, silent = false })
