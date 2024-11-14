local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- auGroups

PersonalGroup = augroup("user101", {})

-----------------------------
---    other configs
-----------------------------

-- TODO: enable spell checking only for markdown files
-- autocmd("MarkdownSpellChecking", {
-- 	group = PersonalGroup,
-- 	filetype = "markdown",
-- 	command = "setlocal spell",
-- })

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

autocmd({ "BufWritePre" }, {
	group = PersonalGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

autocmd({ "BufRead", "BufEnter" }, {
	group = PersonalGroup,
	pattern = "*.astro",
	command = "set filetype=astro",
})

autocmd({ "BufRead", "BufEnter" }, {
	group = PersonalGroup,
	pattern = "*.templ",
	command = "set filetype=templ",
})

autocmd({ "BufRead", "BufEnter" }, {
	group = PersonalGroup,
	pattern = "*.m",
	command = "set filetype=matlab",
})

autocmd({ "BufRead", "BufEnter" }, {
	group = PersonalGroup,
	pattern = "*.pcss",
	command = "set filetype=css",
})

autocmd({ "BufRead", "BufEnter" }, {
	group = PersonalGroup,
	pattern = "*.eta",
	command = "set filetype=html",
})

-- ---------------------------
-- - python config
-- ---------------------------

local conda_path = os.getenv("CONDA_PREFIX")

if next(vim.fn.argv()) ~= nil and conda_path then
	vim.g["python3_host_prog"] = conda_path .. "/bin/python"
end

-- ---------------------------
-- - Emmet config
-- ---------------------------

-- only enable in insert mode
vim.g["user_emmet_mode"] = "i"
vim.g["user_emmet_leader_key"] = "<C-r>"

-- ---------------------------
-- - dart config
-- ---------------------------
vim.g["dart_format_on_save"] = 1
vim.g["dart_fmt_options"] = { "--line-length=86" }

-- - perl config (yes)
vim.g.loaded_perl_provider = 0
