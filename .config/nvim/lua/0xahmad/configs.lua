local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- auGroups

PersonalGroup = augroup("0xaf2f6ad", {})
-- BlackOnSave = augroup("BOS", {})

-- Copilot config

-- vim.cmd([[ imap <silent><script><expr> <Leader>; copilot#Accept("\<CR>") ]])
-- vim.cmd([[ let g:copilot_no_tab_map = v:true ]])

-----------------------------
---    other configs
-----------------------------

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
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

-- ---------------------------
-- - python config
-- ---------------------------

local conda_path = os.getenv("CONDA_PREFIX")

if next(vim.fn.argv()) ~= nil and conda_path then
	vim.g["python3_host_prog"] = conda_path .. "/bin/python"
end

-- autocmd({ "BufWritePre" }, {
-- 	group = BlackOnSave,
-- 	pattern = "*.py",
-- 	command = "Black",
-- })

-- ---------------------------
-- - Emmet config
-- ---------------------------

-- only enable in insert mode
vim.g["user_emmet_mode"] = "a"
vim.g["user_emmet_leader_key"] = "<C-r>"

-- ---------------------------
-- - dart config
-- ---------------------------
vim.g["dart_format_on_save"] = 1
vim.g["dart_fmt_options"] = { "--line-length=86" }

-- - perl config (yes)
vim.g.loaded_perl_provider = 0
