local ok, cline = pcall(require, "cokeline")
local get_hex = require("cokeline/utils").get_hex
local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

if not ok then
	return
end

local modified_clr = "#73daa1"
local error_clr = "#f7768e"
local warning_clr = "#e0af68"
local primary_clr_1 = "#9aa5ce"
local focused_clr_1 = "#7aa2f7"
local primary_dark_1 = "#1c2437"
local background_dark_1 = "#1a1b26"

local buffer_width = 32

local get_clr = function(buffer, default_value)
	local is_err = buffer.diagnostics.errors ~= 0
	local is_warning = buffer.diagnostics.warnings ~= 0
	if is_err then
		if buffer.is_focused then
			return error_clr
		end
	end
	if is_warning then
		if buffer.is_focused then
			return warning_clr
		end
	end
	if buffer.is_modified then
		if not is_warning and not is_err then
			return modified_clr
		end
	end
	if buffer.is_focused then
		return focused_clr_1
	end
	return default_value
end

-- TODO: the error tab when not focused should be grayed out

local get_text_clr = function(buffer, f_value, s_value)
	f_value = f_value or primary_clr_1
	s_value = s_value or background_dark_1
	local the_bg_is_not_getting_color = not get_clr(buffer)
	local there_is_warning_and_not_focused = buffer.diagnostics.warnings ~= 0 and not buffer.is_focused
	local there_is_error_and_not_focused = buffer.diagnostics.errors ~= 0 and not buffer.is_focused
	if the_bg_is_not_getting_color then
		if there_is_warning_and_not_focused then
			return warning_clr
		end
		if there_is_error_and_not_focused then
			return error_clr
		end
		return f_value
	else
		return s_value
	end
end

local components = {
	separator = {
		text = function(buffer)
			-- to give the first buffer some left padding
			return (buffer.index == 1 and " ") or ""
		end,
		bg = function(buffer)
			if buffer.index ~= 1 then
				return background_dark_1
			end
			return get_clr(buffer, background_dark_1)
		end,
		truncation = { priority = 1 },
	},

	space = {
		text = " ",
		truncation = { priority = 1 },
	},
	left_half_circle = {
		text = function(buffer)
			if buffer.index ~= 1 then
				return " "
			end
			return ""
		end,
		fg = function(buffer)
			if buffer.index ~= 1 then
				return background_dark_1
			end
			return get_clr(buffer, background_dark_1)
		end,
		bg = function(buffer)
			return get_clr(buffer, primary_dark_1)
		end,
		truncation = { priority = 1 },
	},

	right_half_circle = {
		text = "",
		fg = function(buffer)
			return get_clr(buffer, primary_dark_1)
		end,
		bg = background_dark_1,
		truncation = { priority = 1 },
	},

	devicon = {
		text = function(buffer)
			return buffer.devicon.icon
		end,
		fg = function(buffer)
			return get_text_clr(buffer, buffer.devicon.color)
		end,
		truncation = { priority = 1 },
	},
	index = {
		text = function(buffer)
			return buffer.index .. " "
		end,
		fg = function(buffer)
			return get_text_clr(buffer)
		end,
		truncation = { priority = 1 },
	},

	unique_prefix = {
		text = function(buffer)
			return buffer.unique_prefix
		end,
		fg = function(buffer)
			return get_text_clr(buffer)
		end,
		style = "italic",
		truncation = {
			priority = 3,
			direction = "left",
		},
	},

	filename = {
		text = function(buffer)
			return buffer.filename
		end,
		fg = function(buffer)
			return get_text_clr(buffer)
		end,
		style = function(buffer)
			return (buffer.is_focused and "bold,underline") or (buffer.diagnostics.errors ~= 0 and "underline") or nil
		end,
		truncation = {
			priority = 2,
			direction = "right",
		},
	},

	close_or_unsaved = {
		text = function(buffer)
			return buffer.is_modified and "  " or "  "
		end,
		fg = function(buffer)
			return get_text_clr(buffer)
		end,
		delete_buffer_on_left_click = true,
		truncation = { priority = 1 },
	},
}

cline.setup({
	show_if_buffers_are_at_least = 2,
	buffers = {
		focus_on_delete = "next",
		new_buffers_position = "next",
	},
	mappings = { cycle_prev_next = true },
	rendering = { max_buffer_width = buffer_width },
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = function(buffer)
			return get_clr(buffer, primary_dark_1)
		end,
	},
	sidebar = {
		filetype = "Neotree",
		components = {
			text = " NeoTree",
			fg = warning_clr,
			bg = background_dark_1,
			style = "bold",
		},
	},
	components = {
		components.separator,
		components.left_half_circle,
		components.devicon,
		components.index,
		components.unique_prefix,
		components.filename,
		components.space,
		components.close_or_unsaved,
		components.right_half_circle,
	},
})

nnoremap("<S-H>", "<Plug>(cokeline-focus-prev)<CR>", { silent = true })
nnoremap("<S-L>", "<Plug>(cokeline-focus-next)<CR>", { silent = true })
nnoremap("<Leader>nx", "<Plug>(cokeline-switch-next)<CR>", { silent = true })
nnoremap("<Leader>nz", "<Plug>(cokeline-switch-prev)<CR>", { silent = true })
