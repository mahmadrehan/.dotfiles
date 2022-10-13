local tabnine = require("cmp_tabnine.config")
local lspkind = require("lspkind")
local cmp = require("cmp")

local s = "> "
local source_mapping = {
	nvim_lsp = s .. "LSP",
	nvim_lua = s .. "Lua",
	pyright = s .. "Piethon",
	tsserver = s .. "TeeJS",
	rust_analyzer = s .. "Rusty",
	gopls = s .. "Go",
	cmp_tabnine = s .. "Prime9",
	path = s .. "Path",
	luasnip = s .. "LuaSnip",
	buffer = s .. "Buffer",
}

cmp.setup({
	mapping = {
		["<Up>"] = cmp.mapping.scroll_docs(-4),
		["<Down>"] = cmp.mapping.scroll_docs(4),
		["<C-D>"] = cmp.mapping.select_prev_item(),
		["<C-F>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},

	sources = {
		{ name = "cmp_tabnine" },
		{ name = "luasnip", option = { use_show_condition = false } },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 4 },
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
				vim_item.kind = ""
				-- vim_item.kind = "ﯢ"
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	window = {
		completion = {
			winhighlight = "Normal:None,FloatBorder:None,Search:None",
			side_padding = 1,
			border = "rounded",
		},
		documentation = {
			border = "rounded",
		},
	},

	experimental = {
		ghost_text = true,
	},

	-- 	priority_weight = 2,
	-- 	comparators = {
	-- 		require("cmp_tabnine.compare"),
	-- 		compare.offset,
	-- 		compare.exact,
	-- 		compare.score,
	-- 		compare.recently_used,
	-- 		compare.kind,
	-- 		compare.sort_text,
	-- 		compare.length,
	-- 		compare.order,
	-- 	},
	-- },
})

-- AUTO PAIRS & TAGS

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("nvim-ts-autotag").setup({})
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Tabnine Completions

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})
