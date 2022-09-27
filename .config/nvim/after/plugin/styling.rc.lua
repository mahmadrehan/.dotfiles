require("bufferline").setup({
	options = {
		buffer_close_icon = "",
		modified_icon = "",
		diagnostics = true,

		offsets = { { filetype = "NeoTree", text = "", padding = 1 } },
	},
})

-- setting some colors
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])

require("indent_blankline").setup({
	show_end_of_line = true,
	show_indent_guides = false,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,

	-- for giving context highlighting, aka bracket-pair colorizer
	--[[ space_char_blankline = " ",
		char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	}, ]]
})

require("colorizer").setup({
	"*",
	css = { rgb_fn = true },
})

-- for showing the current mode in current line
require("modes").setup({
	colors = {
		copy = "#f5c359",
		delete = "#cc3553",
		insert = "#8971ff",
		visual = "#ffffff",
	},
})
