vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- set for folding stuff
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 24

-- makes it so you can have local .vimrc files and put custom config in there set exrc
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.backspace = { "indent", "eol", "start" }

vim.opt.undodir = os.getenv("HOME") .. "/.local/undodir"
vim.opt.undodir = "undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "92"
vim.opt.encoding = "utf-8"
-- Give more space for displaying msgs n stuff
vim.opt.cmdheight = 2
-- reducing the refresh time for the editor
vim.opt.updatetime = 50

-- give all color range to the terminal
vim.opt.termguicolors = true
vim.cmd([[ set t_Co=256 ]])
-- vim.opt.t_Co = 256

vim.g.mapleader = " "
