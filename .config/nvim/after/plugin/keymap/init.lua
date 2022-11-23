local Remap = require("user.keymap")
local nmap = Remap.nmap
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap

inoremap("<C-c>", "<C-O>i<Right><Esc>")

nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>")

nnoremap("<C-q>", ":wqa<CR>")

nnoremap("<leader>q", ":bd!<CR>")
vnoremap("<leader>q", ":bd!<CR>")

-- for a quick search and replace

nnoremap("<leader>fr", ":%s/")

xnoremap("<leader>p", '"_dP')

-- for setting the clipboard to global
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- for sourcing a file to nvim
nnoremap("<leader>this", ":so %<CR>")

-- for opening my file explorer in the opened file/directory
nnoremap("<leader>fexp", ":! dolphin .<CR>")

-- ---
-- telescope rempas
-- ---

local opts = { silent = true }

nnoremap("<leader>fd", ":Telescope live_grep<CR>")

nnoremap("<leader>jf", function()
	require("telescope").extensions.recent_files.pick()
end, opts)

nnoremap("<C-p>", function()
	require("telescope.builtin").git_files()
end, opts)

nnoremap("<Leader>se", function()
	require("telescope.builtin").find_files()
end, opts)

nnoremap("<Leader>pb", function()
	require("telescope.builtin").buffers()
end, opts)

nnoremap("<Leader>vh", function()
	require("telescope.builtin").help_tags()
end, opts)

-- local telescope remaps
nnoremap("<Leader>sdf", function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
	})
end, opts)

nnoremap("<Leader>gc", function()
	local actions = require("telescope.actions")
	require("telescope.builtin").git_branches({
		attach_mappings = function(_prompt_bufnr, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end, opts)

-- Other remaps
nnoremap("Y", "y$")
nnoremap("Y", "yg$")

-- Keep the cursor centered on the following
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`zmz")

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv")

vnoremap("K", ":m '>-2<CR>gv=gv")
inoremap("<A-k>", "<esc>:m .-2<CR>==")
inoremap("<A-j>", "<esc>:m .+1<CR>==")
