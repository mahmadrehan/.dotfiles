local Remap = require("0xahmad.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

inoremap("jj <C-O>i<Right><Esc>")
inoremap("<C-c> <Esc>")

-- vscode soy dev here so ya...
nnoremap("<C-s> :w<CR>")
inoremap("<C-s> <Esc>:w<CR>")
vnoremap("<C-s> :w<CR>")

nnoremap("<C-w> :wq<CR>")
vnoremap("<C-w> :wq<CR>")
nnoremap("<C-q> :q!<CR>")
vnoremap("<C-q> :q!<CR>")

nnoremap("<leader>q :bd<CR>")
vnoremap("<leader>q :bd<CR>")

-- for setting the clipboard to global
nnoremap('<leader>y "+y')
vnoremap('<leader>y "+y')

-- ---
-- telescope rempas
-- ---
nnoremap(
	"<leader>find :lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"What r ya lookin' for sherlock? :: \")})<CR>"
)
nnoremap("<C-p> :lua require('telescope.builtin').git_files()<CR>")
nnoremap("<Leader>s :lua require('telescope.builtin').find_files()<CR>")

nnoremap("<Leader>pb :lua require('telescope.builtin').buffers()<CR>")
nnoremap("<Leader>vh :lua require('telescope.builtin').help_tags()<CR>")
-- local telescope remaps
nnoremap("<Leader>vrc :lua require('0xahmad.telescope').search_dotfiles()<CR>")
nnoremap("<Leader>gc :lua require('0xahmad.telescope').git_branches()<CR>")

-- a good one, for renaming locally
vim.keymap.set("<Leader>", "gr", require("lspsaga.rename").lsp_rename, { silent = true, noremap = true })

-- ---
-- bufferline remaps
-- ---
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap("<S-L> :BufferLineCycleNext<CR>")
nnoremap("<S-H> :BufferLineCyclePrev<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
nnoremap("<Leader>mvz :BufferLineMoveNext<CR>")
nnoremap("<Leader>mvx :BufferLineMovePrev<CR>")

-- These commands will sort buffers by directory, language, or a custom criteria
nnoremap("<Leader>bse :BufferLineSortByExtension<CR>")
nnoremap("<Leader>bd :BufferLineSortByDirectory<CR>")

nnoremap("Y y$")
nnoremap("Y yg$")

-- Keep the cursor centered on the following
nnoremap("n nzzzv")
nnoremap("N Nzzzv")
nnoremap("J mzJ`z")

-- The greatest remap acc. to theprimeagen
-- xnoremap <leader>p "_dP

-- Move lines
vnoremap("J :m '>+1<CR>gv=gv")
vnoremap("K :m '>-2<CR>gv=gv")
inoremap("<C-k> <esc>:m .-2<CR>==")
inoremap("<C-j> <esc>:m .+1<CR>==")
