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
		cokeline_bold = true, -- When `true`, section headers in the lualine theme will be bold
		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors) end,
		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors) end,
	})
	-- These commands will sort buffers by directory, language, or a custom criteria
	vim.cmd([[colorscheme tokyonight]])
end

function GruvBox()
	-- setup must be called before loading the colorscheme
	-- Default options:
	require("gruvbox").setup({
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
	vim.cmd("colorscheme gruvbox")
end

function NightFox()
	local ok, nfx = pcall(require, "nightfox")

	if not ok then
		return
	end

	-- Default options
	nfx.setup({
		options = {
			-- Compiled file's destination location
			compile_path = vim.fn.stdpath("cache") .. "/nightfox",
			compile_file_suffix = "_compiled", -- Compiled file suffix
			transparent = true, -- Disable setting background
			terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
			dim_inactive = true, -- Non focused panes set to alternative background
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
	vim.cmd("colorscheme carbonfox")
end

TokyoNight()
-- GruvBox()
