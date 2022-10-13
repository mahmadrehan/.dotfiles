local Remap = require("0xahmad.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap

inoremap("<C-c>", "<C-O>i<Right><Esc>")

nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>")

nnoremap("<C-q>", ":wqa<CR>")

nnoremap("<leader>q", ":bd!<CR>")
vnoremap("<leader>q", ":bd!<CR>")

-- for a quick search and replace

nnoremap("<leader>fr", ":%s/")

-- for setting the clipboard to global
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- for sourcing a file to nvim
nnoremap("<leader>this", ":so %<CR>")

-- ---
-- telescope rempas
-- ---

nnoremap("<leader>find", ":Telescope live_grep<CR>")
nnoremap("<leader>cl", ":Telescope neoclip<CR>")

nnoremap("<C-p>", function()
	require("telescope.builtin").git_files()
end)

nnoremap("<Leader>se", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<Leader>pb", function()
	require("telescope.builtin").buffers()
end)

nnoremap("<Leader>vh", function()
	require("telescope.builtin").help_tags()
end)

-- local telescope remaps
nnoremap("<Leader>sdf", function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
	})
end)

nnoremap("<Leader>gc", function()
	local actions = require("telescope.actions")
	require("telescope.builtin").git_branches({
		attach_mappings = function(_prompt_bufnr, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end)

-- ---
-- bufferline remaps
-- ---

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
-- nnoremap("<S-L>", ":BufferLineCycleNext<CR>")
-- nnoremap("<S-H>", ":BufferLineCyclePrev<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
-- nnoremap("<Leader>nx", ":BufferLineMoveNext<CR>")
-- nnoremap("<Leader>nz", ":BufferLineMovePrev<CR>")

-- Other remaps
nnoremap("Y", "y$")
nnoremap("Y", "yg$")

-- Keep the cursor centered on the following
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '>-2<CR>gv=gv")
inoremap("<A-k>", "<esc>:m .-2<CR>==")
inoremap("<A-j>", "<esc>:m .+1<CR>==")
