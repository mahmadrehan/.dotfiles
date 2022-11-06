local nnoremap = require("0xahmad.keymap").nnoremap

local silent = { silent = true }

-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader>a", function()
	require("harpoon.mark").add_file()
end, silent)

nnoremap("<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)

for i = 9, 1, -1 do
	nnoremap("<A-" .. i .. ">", function()
		require("harpoon.ui").nav_file(i)
	end, silent)
end
