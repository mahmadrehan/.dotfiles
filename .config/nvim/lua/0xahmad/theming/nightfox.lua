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
		-- Inverse highlight for different types
		inverse = { match_paren = true, visual = false, search = false },
		-- List of various plugins and additional options
		modules = {},
	},
	palette = {
		-- Everything defined under `all` will be applied to each style.
		all = {
			-- Each palette defines these colors:
			--   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
			--
			-- These colors have 3 shades: base, bright, and dim
			--
			-- Defining just a color defines it's base color
		},
		nightfox = {
			-- A specific style's value will be used over the `all`'s value
			black = "#000000",
			white = "#ffffff",
			red = "#c94f6d",
			pink = "#Bf7fbc",
			green = "#00bd68",
			magenta = "#662dfd",
			blue = "#135eb3",
			cyan = "#0da28f",
			orange = "#Ffb264",
		},
	},

	specs = {
		nightfox = {
			syntax = {
				-- As with palettes, a specific style's value will be used over the `all`'s value.
				string = "green.bright",
				regex = "orange",
				operator = "orange",
				func = "blue.bright",
				keyword = "magenta",
				variable = "white",
				number = "cyan",
				conditional = "pink",
				const = "cyan",
			},
		},
	},
})

vim.cmd("colorscheme nightfox")
--vim.cmd("colorscheme duskfox")
--vim.cmd("colorscheme nordfox")
