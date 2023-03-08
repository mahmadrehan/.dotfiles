local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end
local actions = require("telescope.actions")
local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "   ",
		color_devicons = true,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		recent_files = {
			stat_files = true,
			only_cwd = true,
		},
	},
})

telescope.load_extension("fzy_native")
telescope.load_extension("harpoon")
telescope.load_extension("recent_files")
-- ---
-- telescope rempas
-- ---

local opts = { silent = true }

nnoremap("<leader>fd", ":Telescope live_grep<CR>")

nnoremap("<C-b>", function()
	require("telescope").extensions.recent_files.pick()
end, opts)

nnoremap("<C-p>", function()
	require("telescope.builtin").find_files({
		hidden = true,
	})
end, opts)

nnoremap("<C-l>", ":Telescope diagnostics<CR>", opts)

nnoremap("<Leader>pb", function()
	require("telescope.builtin").buffers()
end, opts)

nnoremap("<Leader>vh", function()
	require("telescope.builtin").help_tags()
end, opts)

-- local telescope remaps
nnoremap("<Leader>sdf", function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
	})
end, opts)

nnoremap("<Leader>gc", function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_prompt_bufnr, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end, opts)
