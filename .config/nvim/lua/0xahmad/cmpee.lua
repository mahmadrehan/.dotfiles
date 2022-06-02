-- Setup nvim-cmp.

local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	pyright = "[Py]",
	pyre = "[Py]",
	tssserver = "[JS/TS]",
	rust_analyzer = "[Rust]",
	gopls = "[Go]",
	cmp_tabnine = "[Tab9]",
	path = "[Path]",
	luasnip = "[LSnippet]",
}
local lspkind = require("lspkind")

cmp.setup({

	mapping = {
		--["<C-d>"] = cmp.mapping.scroll_docs(-4),
		--["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Up>"] = cmp.mapping.scroll_docs(-4),
		["<Down>"] = cmp.mapping.scroll_docs(4),
		--["<Up>"] = cmp.mapping.select_prev_item(),
		--["<Down>"] = cmp.mapping.select_next_item(),
		["<C-D>"] = cmp.mapping.select_prev_item(),
		["<C-F>"] = cmp.mapping.select_next_item(),

		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 4 },
	},
})
