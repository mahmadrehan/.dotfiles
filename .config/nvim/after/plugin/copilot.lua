local ok, copilot = pcall(require, "copilot")
if not ok then
	return
end

copilot.setup({
	panel = {
		enabled = true,
		auto_refresh = true,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "cor",
			open = "<M-CR>",
		},
		layout = {
			position = "left", -- | top | left | right
			ratio = 0.3,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<M-;>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})

-- INFO: this is for copilot.vim
-- vim.g.copilot_filetypes = {
-- 	yaml = false,
-- 	markdown = false,
-- 	help = false,
-- 	gitcommit = false,
-- 	gitrebase = false,
-- 	hgcommit = false,
-- 	svn = false,
-- 	cvs = false,
-- }
--
-- vim.cmd([[imap <silent><script><expr> <M-;> copilot#Accept("\<CR>")]])
--
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_no_enter_map = true
-- vim.g.copilot_no_space_map = true
-- vim.g.copilot_no_backspace_map = true
--
-- vim.cmd([[highlight CopilotSuggestion guifg=#6B718C ctermfg=8]])
