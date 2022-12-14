local ok, ib = pcall(require, "indent_blankline")

if not ok then
	return
end

ib.setup({
	show_end_of_line = true,
	show_indent_guides = false,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
})

local ok2, c = pcall(require, "colorizer")

if not ok2 then
	return
end

c.setup({
	"*",
	css = { rgb_fn = true },
})

-- for showing the current mode in current line
-- require("modes").setup({
-- 	colors = {
-- 		copy = "#f5c359",
-- 		delete = "#cc3553",
-- 		insert = "#8971ff",
-- 		visual = "#ffffff",
-- 	},
-- })
