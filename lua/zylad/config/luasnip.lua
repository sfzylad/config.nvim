local ls = require('luasnip')
local types = require("luasnip.util.types")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

ls.config.setup({
    history = true, -- keep around last snippet local to jump back
    updateevents = "TextChanged,TextChangedI", -- update changes as you type
    enable_autosnippets = true,
    ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},

    -- treesitter-hl has 100, use something higher (default is 200)
    ext_base_prio = 300,
    -- minimal increase in priority
    ext_prio_increase = 1,
    store_selection_keys = "<Tab>",
})


vim.keymap.set({ "i", "s" }, "<a-p>", function (opts)
    if ls.expand_or_jumpable() then
        ls.expand(opts)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-k>", function ()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-j>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-l>", function ()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function ()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)
