local ok, spectre = pcall(require, "spectre")

if not ok then
	return
end

local nnoremap = require("user.keymap").nnoremap
local vnoremap = require("user.keymap").vnoremap

spectre.setup({})

local silent = { silent = true }

nnoremap("<leader>S", function()
	spectre.toggle()
end, silent)

vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})

nnoremap("<leader>sw", function()
	spectre.open_visual({ select_word = true })
end)

vnoremap("<leader>sw", function()
	spectre.open_visual({ select_word = true })
end)

nnoremap("<leader>sp", function()
	spectre.open_file_search({ select_word = true })
end)
