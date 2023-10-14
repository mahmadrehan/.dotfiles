local o = vim.opt

-- o.clipboard = "unnamedplus"
o.clipboard = ""
o.mouse = "a"

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

o.cindent = true
o.smartindent = true
o.autoindent = true
o.wrap = true

-- setup folds in vim

o.foldmethod = "indent"
o.foldnestmax = 10
o.foldlevel = 99
o.foldlevelstart = 99
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldminlines = 1

o.nu = true
o.relativenumber = true

o.hlsearch = false
o.hidden = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.backup = false
o.swapfile = false
o.undodir = os.getenv("HOME") .. "/.local/undodir"
o.undofile = true

o.backspace = "indent,eol,start"

o.cmdheight = 1
o.updatetime = 50
o.timeoutlen = 500
o.scrolloff = 8
o.showmode = false
o.completeopt = { "menuone", "noinsert", "noselect" }
o.signcolumn = "yes"

o.colorcolumn = "82"
o.encoding = "utf-8"

vim.g.mapleader = " "

o.termguicolors = true
-- to make the cursor thick for all modes
-- o.guicursor = ""

vim.cmd("set t_Co=256")
