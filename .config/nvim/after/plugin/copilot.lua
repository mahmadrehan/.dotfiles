vim.g.copilot_filetypes = {
	yaml = false,
	markdown = false,
	help = false,
	gitcommit = false,
	gitrebase = false,
	hgcommit = false,
	svn = false,
	cvs = false,
}

vim.cmd([[imap <silent><script><expr> <M-;> copilot#Accept("\<CR>")]])

vim.g.copilot_no_tab_map = true
vim.g.copilot_no_enter_map = true
vim.g.copilot_no_space_map = true
vim.g.copilot_no_backspace_map = true

vim.cmd([[highlight CopilotSuggestion guifg=#6B718C ctermfg=8]])
