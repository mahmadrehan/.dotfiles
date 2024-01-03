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

-- write all
nnoremap("<leader>w", ":wall<CR>")
vnoremap("<leader>w", ":wall<CR>")

nnoremap("<leader>op", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- INFO: this cursed keybind has to exist because of neotree's overriding of the foldmethod
nnoremap("<leader>mi", ":set foldmethod=indent<CR>")

-- for a quick searh and replace

nnoremap("<leader>sr", ":%s/")

-- for pasting but not copying the selected to buffer
xnoremap("<leader>p", '"_dP')

-- for setting the clipboard to global
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- for sourcing a file to nvim
nnoremap("<leader>this", ":so %<CR>")

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

nnoremap("<leader>x", "<cmd>!chmod +x %<CR>")
