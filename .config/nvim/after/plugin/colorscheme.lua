function TokyoNight()
	local ok, tkn = pcall(require, "tokyonight")
	if not ok then
		return
	end
	tkn.setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Can be "dark", "transparent" or "normal"
			sidebars = "transparent",
			floats = "transparent",
		},
		sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		-- Enabling will hide inactive statuslines n replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		hide_inactive_statusline = false,
		dim_inactive = true, -- dims inactive windows
		lualine_bold = true,
	})
	-- These commands will sort buffers by directory, language, or a custom criteria
	vim.cmd.colorscheme("tokyonight")
end

function RosePine()
	local ok, rose = pcall(require, "rose-pine")
	if not ok then
		return
	end
	rose.setup({
		--- @usage 'auto'|'main'|'moon'|'dawn'
		variant = "moon",
		--- @usage 'main'|'moon'|'dawn'
		dark_variant = "moon",
		bold_vert_split = true,
		dim_nc_background = true,
		disable_background = true,
		disable_float_background = true,
		disable_italics = true,
		--- @usage string hex value or named color from rosepinetheme.com/palette
		groups = {
			background = "base",
			background_nc = "_experimental_nc",
			panel = "surface",
			panel_nc = "base",
			border = "highlight_med",
			comment = "muted",
			link = "iris",
			punctuation = "subtle",
			error = "love",
			hint = "iris",
			info = "foam",
			warn = "gold",
			headings = {
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		},
		-- Change specific vim highlight groups
		-- https://github.com/rose-pine/neovim/wiki/Recipes
		highlight_groups = {
			ColorColumn = { bg = "surface" },
			-- Blend colours against the "base" background
			CursorLine = { bg = "foam", blend = 10 },
			StatusLine = { fg = "love", bg = "love", blend = 10 },
		},
	})
	-- These commands will sort buffers by directory, language, or a custom criteria
	vim.cmd.colorscheme("rose-pine")
end

function Kanagawa()
	local ok, _k = pcall(require, "kanagawa")
	if not ok then
		return
	end
	_k.setup({
		compile = true, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = true, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {
			-- add/modify theme and palette colors
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		background = { dark = "wave" },
	})
	vim.cmd.colorscheme("kanagawa")
end

function Catppuccin()
	local ok, _k = pcall(require, "catppuccin")
	if not ok then
		return
	end
	_k.setup({
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		background = {
			light = "macchiato",
			dark = "macchiato",
		},
		transparent_background = true,
		show_end_of_buffer = true, -- show the '~' characters after the end of buffers
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			lsp_saga = true,
			gitsigns = true,
			neotree = true,
			telescope = true,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

function Nightfox()
	local ok, _k = pcall(require, "nightfox")
	if not ok then
		return
	end
	_k.setup({
		options = {
			compile_path = vim.fn.stdpath("cache") .. "/nightfox",
			compile_file_suffix = "_compiled", -- Compiled file suffix
			transparent = true, -- Disable setting background
			terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
			dim_inactive = false, -- Non focused panes set to alternative background
			module_default = true, -- Default enable value for modules
			colorblind = {
				enable = false, -- Enable colorblind support
				simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
				severity = {
					protan = 0, -- Severity [0,1] for protan (red)
					deutan = 0, -- Severity [0,1] for deutan (green)
					tritan = 0, -- Severity [0,1] for tritan (blue)
				},
			},
			styles = { -- Style to be applied to different syntax groups
				comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
				conditionals = "NONE",
				constants = "NONE",
				functions = "NONE",
				keywords = "NONE",
				numbers = "NONE",
				operators = "NONE",
				strings = "NONE",
				types = "NONE",
				variables = "NONE",
			},
			inverse = { -- Inverse highlight for different types
				match_paren = false,
				visual = false,
				search = false,
			},
			modules = { -- List of various plugins and additional options
				-- ...
			},
		},
		palettes = {},
		specs = {},
		groups = {},
	})

	-- setup must be called before loading
	vim.cmd("colorscheme duskfox")
end

-- TokyoNight()
-- Kanagawa()
-- Catppuccin()
Nightfox()
