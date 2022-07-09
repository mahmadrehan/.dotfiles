-- setting some colors

-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#B73F4C gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#E0AA2E gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#379DAA gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#3746AA gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#3DDC84 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#6E5ACC gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

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

-- colorizer setup ( it does #444 <- This )

require("colorizer").setup({
	"*",
	css = { rgb_fn = true },
})
