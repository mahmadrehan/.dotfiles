local augroup = vim.api.nvim_create_augroup

-- auGroups

PersonalGroup = augroup("0xaf2f6ad", {})
BlackOnSave = augroup("BOS", {})

-----------------------------
---    other configs
-----------------------------

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			40,
		})
	end,
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
	group = PersonalGroup,
	pattern = "*.rs",
	callback = function()
		require("lsp_extensions").inlay_hints({})
	end,
})

autocmd({ "BufWritePre" }, {
	group = PersonalGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- - perl config (yes)
-- ---------------------------

vim.g.loaded_perl_provider = 0

-- ---------------------------
-- - python config
-- ---------------------------

local conda_path = os.getenv("CONDA_PREFIX")

print(conda_path)

if next(vim.fn.argv()) ~= nil and conda_path then
	vim.g["python3_host_prog"] = conda_path + "/bin/python"
end

autocmd({ "BufWritePre" }, {
	group = BlackOnSave,
	pattern = "*.py",
	command = "Black",
})

-- ---------------------------
-- - Emmet config
-- ---------------------------

-- only enable in insert mode
vim.g["user_emmet_mode"] = "a"
vim.g["user_emmet_leader_key"] = "<C-l>"

-- ---------------------------
-- - dart config
-- ---------------------------
vim.g["dart_format_on_save"] = 1
vim.g["dart_fmt_options"] = { "--line-length=92" }

-- ---------------------------
-- - prettier config
-- ---------------------------

vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0
vim.g["prettier#exec_cmd_async"] = 1 -- " force run async
vim.g["prettier#config#print_width"] = "92"
vim.g["prettier#config#tab_width"] = "2"
vim.g["prettier#config#use_tabs"] = "auto"
vim.g["prettier#config#parse"] = ""
vim.g["prettier#config#config_precedence"] = "file-override"
vim.g["prettier#config#prose_wrap"] = "preserve"
vim.g["prettier#config#html_whitespace_sensitivity"] = "css"
vim.g["prettier#config#require_pragma"] = "true"
