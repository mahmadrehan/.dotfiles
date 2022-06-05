-- Default options
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			-- Value is any valid attr-list value `:help attr-list`
			variables = "NONE",
			comments = "NONE",

			strings = "italic",
			functions = "italic",
			numbers = "italic",

			conditionals = "bold",
			constants = "bold",
			keywords = "bold",
			operators = "bold",
			types = "bold",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = true,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
})

--vim.cmd("colorscheme terafox")
vim.cmd("colorscheme nightfox")
