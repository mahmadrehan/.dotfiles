local nnoremap = require("user.keymap").nnoremap

local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
	return
end

gitsigns.setup({})

local ok2, neogit = pcall(require, "neogit")

if not ok2 then
	return
end

neogit.setup({})

nnoremap("<leader>gs", function()
	neogit.open({})
end)
