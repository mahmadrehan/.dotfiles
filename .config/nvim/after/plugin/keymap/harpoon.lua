local nnoremap = require("user.keymap").nnoremap

local ok, harpoon = pcall(require, "harpoon")

if not ok then
	return
end

harpoon:setup()

local silent = { silent = true }

nnoremap("<leader>a", function()
	harpoon:list():append()
end, silent)

nnoremap("<leader>b", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, silent)

for i = 9, 0, -1 do
	nnoremap("<leader>" .. i, function()
		harpoon:list():select(i)
	end, silent)
end
