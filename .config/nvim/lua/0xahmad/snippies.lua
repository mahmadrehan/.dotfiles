local ls = require("luasnip")

require("luasnip.loaders.from_lua").lazy_load({
	paths = "~/.config/nvim/snippets/",
})

-- extend from some pre-confs (TODO)
--[[ ls.filetype_extend("Python") ]]
-- ls.filetype_extend("HTML")
-- ls.filetype_extend("Javascript")
-- ls.filetype_extend("Typescript")
-- ls.filetype_extend("Javascriptreact")
-- ls.filetype_extend("Typescriptreact")
-- ls.filetype_extend("Markdown")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { "⬤", "GruvboxOrange" } },
			},
		},
	},
})

--vim.keymap.set({ "i", "s" }, "<a-p>", function()
--if ls.expand_or_jumpable() then
--ls.expand()
--end
--end)

--vim.keymap.set({ "i", "s" }, "<a-j>", function()
--if ls.jumpable(-1) then
--ls.jump(-1)
--end
--end)

--vim.keymap.set({ "i", "s" }, "<a-k>", function()
--if ls.jumpable(1) then
--ls.jump(1)
--end
--end)

--vim.keymap.set({ "i", "s" }, "<a-l>", function()
--if ls.choice_active() then
--ls.change_choice(1)
--end
--end)

--vim.keymap.set({ "i", "s" }, "<a-h>", function()
--if ls.choice_active() then
--ls.change_choice(-1)
--end
--end)
