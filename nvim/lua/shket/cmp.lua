local cmp = require("cmp")
-- local luasnip = require("luasnip")

cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         luasnip.lsp_expand(args.body)
    --     end,
    -- },
    mapping = {
        ["<C-U>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-D>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-B>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
        ["<C-F>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-E>"] = cmp.mapping.close(),
        --["<C-H>"] = cmp.mapping.abort(),
        ["<C-L>"] = cmp.mapping.confirm({ select = true }),
        ["<C-K>"] = cmp.mapping.select_prev_item(),
        ["<C-J>"] = cmp.mapping.select_next_item(),
        ["<C-P>"] = cmp.mapping.select_prev_item(),
        ["<C-N>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if luasnip.jumpable(1) then
        --         luasnip.jump(1)
        --     elseif cmp.visible() then
        --         cmp.select_next_item()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     elseif cmp.visible() then
        --         cmp.select_prev_item()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
    },

    sources = {
        { name = "nvim_lsp" },
        -- { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
        --{ name = "cmp_tabnine" },
    },
})

-- require("luasnip.loaders.from_vscode").lazy_load()

--local tabnine = require('cmp_tabnine.config')
--tabnine:setup({
--	max_lines = 1000;
--	max_num_results = 20;
--	sort = true;
--	run_on_every_keystroke = true;
--	snippet_placeholder = '..';
--	ignored_file_types = { -- default is not to ignore
--		-- uncomment to ignore in lua:
--		-- lua = true
--	};
--	show_prediction_strength = false;
--})
