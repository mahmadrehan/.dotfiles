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
		--- @usage 'main' | 'moon'
		dark_variant = "main",
		bold_vert_split = true,
		dim_nc_background = true,
		disable_background = true,
		disable_float_background = true,
		disable_italics = true,

		--- @usage string hex value or named color from rosepinetheme.com/palette
		groups = {
			background = "base",
			panel = "surface",
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
		highlight_groups = {
			ColorColumn = { bg = "surface" },
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
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = true, -- do not set background color
		dimInactive = true, -- dim inactive window `:h hl-NormalNC`
		globalStatus = false, -- adjust window separators highlight for laststatus=3
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {},
		overrides = {},
		theme = "default", -- Load "default" theme or the experimental "light" theme
	})
	vim.cmd.colorscheme("kanagawa")
end

-- RosePine()
-- TokyoNight()
Kanagawa()
