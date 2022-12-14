local ok, nvim_ts_conf = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

local nnoremap = require("user.keymap").nnoremap

nvim_ts_conf.setup({
	ensure_installed = "all",
	sync_install = false,

	autotag = {
		enable = true,
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

function ContextSetup(show_all_context)
	local ok, tscont = pcall(require, "treesitter-context")
	if not ok then
		return
	end

	tscont.setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		throttle = true, -- Throttles plugin updates (may improve performance)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		show_all_context = show_all_context,
		patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				"function",
				"method",
				"for",
				"while",
				"if",
				"switch",
				"case",
			},

			rust = {
				"loop_expression",
				"impl_item",
			},

			typescript = {
				"class_declaration",
				"abstract_class_declaration",
				"else_clause",
			},
		},
	})
end

nnoremap("<leader>cf", function()
	ContextSetup(true)
end)
nnoremap("<leader>cp", function()
	ContextSetup(false)
end)
ContextSetup(false)
