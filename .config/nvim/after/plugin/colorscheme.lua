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

function GruvBox()
	local ok, gruvbox = pcall(require, "gruvbox")

	if not ok then
		return
	end

	gruvbox.setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = true,
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})
	vim.cmd.colorscheme("gruvbox")

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
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

function Catppuccin()
	local ok, catppuccin = pcall(require, "catppuccin")

	if not ok then
		return
	end

	catppuccin.setup({
		flavour = "mocha", -- latte, frappe, macihiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = true,
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
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			notify = false,
			mini = false,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})

	vim.cmd.colorscheme("catppuccin")
end

-- Catppuccin()
-- GruvBox()
-- RosePine()
TokyoNight()
