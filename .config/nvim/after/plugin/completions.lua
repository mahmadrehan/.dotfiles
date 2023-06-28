local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end
local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

-- local ok, tabnine = pcall(require, "cmp_tabnine.config")
-- if not ok then
-- 	return
-- end

local s = "> "
local source_mapping = {
	nvim_lsp = s .. "LSP",
	nvim_lua = s .. "Lua",
	cmp_tabnine = s .. "T9",
	path = s .. "Path",
	cmp_path = s .. "Path",
	luasnip = s .. "LuaSnip",
}

local mappings = {
	["<Up>"] = cmp.mapping.scroll_docs(-4),
	["<Down>"] = cmp.mapping.scroll_docs(4),
	["<C-D>"] = cmp.mapping.select_prev_item(),
	["<C-F>"] = cmp.mapping.select_next_item(),
	["<Tab>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Ctrl-e>"] = cmp.mapping.close(),
}

cmp.setup({
	mapping = mappings,
	sources = {
		-- { name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "path",    option = { trailing_slash = true } },
		{ name = "luasnip", option = { use_show_condition = false } },
	},
	snippet = {
		expand = function(args)
			local ok, lsnip = pcall(require, "luasnip")
			if not ok then
				return
			end
			lsnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			local symbol_map = {
				Variable = "",
				Constant = "",
				Function = "",
				Class = "",
				Method = "",
				Keyword = "",
				Enum = "",
				Type = "",
				Property = "",
				-- Field = "",
				Field = "",
			}
			-- local c_type = vim_item.kind
			if symbol_map[vim_item.kind] then
				vim_item.kind = symbol_map[vim_item.kind]
			else
				vim_item.kind = lspkind.presets.default[vim_item.kind]
			end
			local menu = source_mapping[entry.source.name]
			-- if entry.source.name == "cmp_tabnine" then
			-- 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 		menu = entry.completion_item.data.detail .. " " .. menu
			-- 	end
			-- 	vim_item.kind = ""
			-- end

			-- vim_item.kind = vim_item.kind .. " " .. c_type
			vim_item.menu = menu
			return vim_item
		end,
	},
	window = {
		completion = {
			winhighlight = "CursorLine:PmenuSel",
			side_padding = 1,
			border = "rounded",
		},
		documentation = {
			border = "rounded",
		},
	},
	experimental = {
		ghost_text = false,
	},
})

-- for commandline completions

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "cmdline" },
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "cmdline" },
	},
})

-- AUTO PAIRS & TAGS

local ok, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not ok then
	return
end
nvim_ts_autotag.setup({})

local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end
nvim_autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Tabnine Completions

-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 10,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })
