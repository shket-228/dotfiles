local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<space>di", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

keymap("n", "<Space>td", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            --buf_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            --buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            --buf_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            buf_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
            -- buf_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
            -- buf_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
            -- buf_keymap(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
            --buf_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
            buf_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
            buf_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            --buf_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            buf_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

            buf_keymap(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
            buf_keymap(bufnr, "n", "gD", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", opts)
            -- buf_keymap(bufnr, "n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
            buf_keymap(bufnr, "n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    -- disable virtual text
                    virtual_text = false,
                    -- show signs
                    signs = true,
                    -- delay update diagnostics
                    update_in_insert = false,
                }
            )
        end,
    }, _config or {})
end

local lspconfig = require("lspconfig")

--lspconfig.jedi_language_server.setup(config())
lspconfig.pyright.setup(config())

--lspconfig.tailwindcss.setup(config())
lspconfig.ccls.setup(config())

lspconfig.bashls.setup(config())

lspconfig.html.setup(config({
    filetypes = {
        "html",
        "htmldjango",
    }
}))

lspconfig.cssls.setup(config())

--lspconfig.eslint.setup(config())
--lspconfig.denols.setup(config())
lspconfig.tsserver.setup(config())

lspconfig.jsonls.setup(config())

lspconfig.texlab.setup(config())

-- lspconfig.sqls.setup(config())
--lspconfig.sqlls.setup(config())

local sumneko_root_path = "/home/shket/.local/share/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
lspconfig.sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}))
