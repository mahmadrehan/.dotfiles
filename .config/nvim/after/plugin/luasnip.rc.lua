local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<", "Hmm" } },
			},
		},
	},
})

-- sourcing snippets

require("luasnip.loaders.from_lua").lazy_load({
	paths = "~/.config/nvim/luasnippets/",
})

require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})

ls.filetype_extend("svelte", { "svelte" })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-;>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.rc.lua<CR>")
