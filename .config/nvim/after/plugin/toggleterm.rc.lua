local ok, tt = pcall(require, "toggleterm")
if not ok then
	return
end
local nnoremap = require("user.keymap").nnoremap

tt.setup({
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 3,
	},
})

nnoremap("<leader>sh", ":ToggleTerm<CR>")
