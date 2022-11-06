vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = true

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 24

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.hidden = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/undodir"
vim.opt.undofile = true

vim.opt.backspace = { "indent", "eol", "start" }

vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.timeoutlen = 500
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.signcolumn = "yes"
-- vim.opt.spell = true

-- vim.opt.colorcolumn = "86"

vim.opt.encoding = "utf-8"

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
--
vim.g.transparent_enabled = true
vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.cmd("set t_Co=256")
