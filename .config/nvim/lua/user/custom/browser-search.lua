-- got this handy little configuration from https://github.com/kidp2h/dotfiles
local Menu = require("nui.menu")
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function callBrowser(value, browser)
	local cmdBrowser = "chromium"
	if browser == "Brave" then
		cmdBrowser = "brave"
	end
	if browser == "Firefox" then
		cmdBrowser = "firefox"
	end
	if browser == "Firefox Dev" then
		cmdBrowser = "firefox-developer-edition"
	end

	local google_search = "silent! !%s 'https://google.com/search?q=%s'"
	local brave_search = "silent! !%s 'https://search.brave.com/search?q=%s'"

	local command = string.format(google_search, cmdBrowser, value)
	vim.api.nvim_command(command)
end

local function BrowserInput(browser)
	local input = Input({
		position = "50%",
		size = {
			width = 48,
			padding = 4,
		},
		side_padding = 8,
		border = {
			style = "rounded",
			text = {
				top = " ~ Your query is my command ~ ",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	}, {
		prompt = "   ",
		default_value = "",
		keymap = {
			close = { "<C-c>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function() end,
		on_submit = function(value)
			if trim(value) ~= "" then
				callBrowser(value, browser)
			end
		end,
	})

	input:mount()
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

local function MenuBrowser()
	local menu = Menu({
		position = "50%",
		size = {
			width = 32,
			height = 4,
		},
		side_padding = 2,
		border = {
			style = "rounded",
			text = {
				top = " 爵Choose Browser 爵",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	}, {
		lines = {
			Menu.item("Brave"),
			Menu.item("Firefox"),
			Menu.item("Firefox Dev"),
		},
		max_width = 32,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<C-c>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function() end,
		on_submit = function(item)
			BrowserInput(item.text)
		end,
	})

	menu:mount()
end

return {
	MenuBrowser = MenuBrowser,
}
