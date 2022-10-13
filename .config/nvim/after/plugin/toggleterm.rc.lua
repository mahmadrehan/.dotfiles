local tt = require("toggleterm")

tt.setup({
	open_mapping = [[<Leader>sh]],
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 3,
	},
})
