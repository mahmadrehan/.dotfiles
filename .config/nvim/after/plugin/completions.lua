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
	path = s .. "Path",
	calc = s .. "Mafs",
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
	["<C-e>"] = cmp.mapping.close(),
}

cmp.setup({
	mapping = mappings,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path", option = { trailing_slash = true } },
		{ name = "calc" },
		{ name = "luasnip", option = { use_show_condition = false } },
		{ name = "emoji" },
		{ name = "latex_symbols" },
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
				Variable = "󰫧",
				Constant = "",
				-- Constant = "",
				Function = "󰡱",
				Class = "",
				-- Method = "∑",
				Keyword = "",
				Enum = "",
				Type = "",
				-- Property = "",
				Property = "",
				Field = "",
			}
			-- local c_type = vim_item.kind
			if symbol_map[vim_item.kind] then
				vim_item.kind = symbol_map[vim_item.kind]
			else
				vim_item.kind = lspkind.presets.default[vim_item.kind]
			end

			local menu = source_mapping[entry.source.name]

			-- vim_item.kind = vim_item.kind .. " " .. c_type
			vim_item.menu = menu

			-- Adding import path display
			if entry.source.name == "nvim_lsp" and entry.completion_item.detail then
				vim_item.menu = vim_item.menu .. " " .. entry.completion_item.detail
			end

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
nvim_ts_autotag.setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})

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
