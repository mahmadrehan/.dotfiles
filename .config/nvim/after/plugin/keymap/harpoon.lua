local nnoremap = require("user.keymap").nnoremap

local ok, _= pcall(require, "harpoon")

if not ok then
	return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local silent = { silent = true }

-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader>a", function()
	mark.add_file()
end, silent)

nnoremap("<C-b>", function()
	ui.toggle_quick_menu()
end, silent)

for i = 9, 1, -1 do
	nnoremap("<A-" .. i .. ">", function()
		ui.nav_file(i)
	end, silent)
end
