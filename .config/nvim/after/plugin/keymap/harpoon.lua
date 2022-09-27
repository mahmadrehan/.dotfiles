local nnoremap = require("0xahmad.keymap").nnoremap

local silent = { silent = true }

-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader>a", function()
	require("harpoon.mark").add_file()
end, silent)

nnoremap("<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)

nnoremap("<A-1>", function()
	require("harpoon.ui").nav_file(1)
end, silent)
nnoremap("<A-2>", function()
	require("harpoon.ui").nav_file(2)
end, silent)
nnoremap("<A-3>", function()
	require("harpoon.ui").nav_file(3)
end, silent)
nnoremap("<A-4>", function()
	require("harpoon.ui").nav_file(4)
end, silent)
