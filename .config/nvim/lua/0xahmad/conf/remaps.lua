local Remap = require("0xahmad.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap

inoremap("jj", "<C-O>i<Right><Esc>")
inoremap("<C-c>", "<Esc>")

nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>")
vnoremap("<C-s>", ":w<CR>")

nnoremap("<C-w>", ":wq<CR>")
vnoremap("<C-w>", ":wq<CR>")
nnoremap("<C-q>", ":q!<CR>")
vnoremap("<C-q>", ":q!<CR>")

nnoremap("<leader>q", ":bd<CR>")
vnoremap("<leader>q", ":bd<CR>")

-- for a quick search and replace

nnoremap("<leader>fr", ":%s/")

-- for sourcing a file to nvim

nnoremap("<leader>this", ":so %<CR>")

-- for setting the clipboard to global
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- ---
-- telescope rempas
-- ---
nnoremap("<leader>find", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("What r ya lookin' for sherlock? :: ") })
end)
nnoremap("<C-p>", function()
	require("telescope.builtin").git_files()
end)
nnoremap("<Leader>s", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<Leader>pb", function()
	require("telescope.builtin").buffers()
end)
nnoremap("<Leader>vh", function()
	require("telescope.builtin").help_tags()
end)
-- local telescope remaps
nnoremap("<Leader>vrc", function()
	require("0xahmad.telescope").search_dotfiles()
end)
nnoremap("<Leader>gc", function()
	require("0xahmad.telescope").git_branches()
end)

-- ---
-- bufferline remaps
-- ---
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap("<S-L>", ":BufferLineCycleNext<CR>")
nnoremap("<S-H>", ":BufferLineCyclePrev<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
nnoremap("<Leader>nx", ":BufferLineMoveNext<CR>")
nnoremap("<Leader>nz", ":BufferLineMovePrev<CR>")

-- These commands will sort buffers by directory, language, or a custom criteria
nnoremap("<Leader>bse", ":BufferLineSortByExtension<CR>")
nnoremap("<Leader>bd", ":BufferLineSortByDirectory<CR>")

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
inoremap("<C-k>", "<esc>:m .-2<CR>==")
inoremap("<C-j>", "<esc>:m .+1<CR>==")
