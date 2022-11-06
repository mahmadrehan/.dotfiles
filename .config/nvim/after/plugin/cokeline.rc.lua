local cline = require("cokeline")
local get_hex = require("cokeline/utils").get_hex
local Remap = require("0xahmad.keymap")
local nnoremap = Remap.nnoremap
local str_rep = string.rep

if not cline then
	return
end

local yellow = vim.g.terminal_color_3
local modified_clr = "#3ddc84"

local comments_fg = get_hex("Comment", "fg")
local errors_fg = get_hex("DiagnosticError", "fg")
local warnings_fg = get_hex("DiagnosticWarn", "fg")
local text_clr = "#6379a9"

local buffer_width = 28

local fg_clr = "#1c2437"
local bg_clr = "#181b26"

local components = {
	separator = {
		text = " ",
		bg = bg_clr,
		truncation = { priority = 1 },
	},

	space = {
		text = " ",
		truncation = { priority = 1 },
	},

	left_half_circle = {
		text = "",
		fg = fg_clr,
		bg = bg_clr,
		truncation = { priority = 1 },
	},

	right_half_circle = {
		text = "",
		fg = fg_clr,
		bg = bg_clr,
		truncation = { priority = 1 },
	},

	devicon = {
		text = function(buffer)
			return buffer.devicon.icon
		end,
		fg = function(buffer)
			return buffer.devicon.color
		end,
		truncation = { priority = 1 },
	},

	index = {
		text = function(buffer)
			return buffer.index .. ": "
			-- return "  "
		end,
		fg = function(buffer)
			return (buffer.diagnostics.errors ~= 0 and errors_fg)
				or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
				or text_clr
		end,
		truncation = { priority = 1 },
	},

	unique_prefix = {
		text = function(buffer)
			return buffer.unique_prefix
		end,
		fg = comments_fg,
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
			return (buffer.diagnostics.errors ~= 0 and errors_fg)
				or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
				or nil
		end,
		style = function(buffer)
			return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
				or (buffer.is_focused and "bold,underline")
				or (buffer.diagnostics.errors ~= 0 and "underline")
				or nil
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
			return buffer.is_modified and modified_clr or nil
		end,
		delete_buffer_on_left_click = true,
		truncation = { priority = 1 },
	},
}

local get_remaining_space = function(buffer)
	local used_space = 0
	for _, component in pairs(components) do
		used_space = used_space
			+ vim.fn.strwidth(
				(type(component.text) == "string" and component.text)
				or (type(component.text) == "function" and component.text(buffer))
			)
	end
	return math.max(0, buffer_width - used_space)
end

local left_padding = {
	text = function(buffer)
		local remaining_space = get_remaining_space(buffer)
		-- return str_rep(" ", remaining_space / 2 + remaining_space % 2)
		return str_rep(" ", remaining_space / 2)
	end,
}

local right_padding = {
	text = function(buffer)
		local remaining_space = get_remaining_space(buffer)
		return str_rep(" ", remaining_space / 2)
	end,
}

cline.setup({
	show_if_buffers_are_at_least = 1,
	buffers = {
		-- focus_on_delete = "prev",
		-- new_buffers_position = "last",
		focus_on_delete = "next",
		new_buffers_position = "next",
	},
	mappings = { cycle_prev_next = true },
	rendering = { max_buffer_width = buffer_width },
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = fg_clr,
	},
	sidebar = {
		filetype = "Neotree",
		components = {
			text = " NeoTree",
			fg = yellow,
			bg = get_hex("Neotree", "bg"),
			style = "bold",
		},
	},
	components = {
		components.separator,
		components.left_half_circle,
		left_padding,
		components.devicon,
		components.index,
		components.unique_prefix,
		components.filename,
		components.space,
		right_padding,
		components.close_or_unsaved,
		components.right_half_circle,
	},
})

nnoremap("<S-H>", "<Plug>(cokeline-focus-prev)<CR>", { silent = true })
nnoremap("<S-L>", "<Plug>(cokeline-focus-next)<CR>", { silent = true })
nnoremap("<Leader>nx", "<Plug>(cokeline-switch-next)<CR>", { silent = true })
nnoremap("<Leader>nz", "<Plug>(cokeline-switch-prev)<CR>", { silent = true })
