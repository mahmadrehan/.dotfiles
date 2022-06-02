function CreateNoremap(type, opts)
	return function(lhs, rhs, bufnr)
		bufnr = bufnr or 0
		vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	end
end

Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })

-- require("0xahmad.git-worktree")
require("0xahmad.niowim-treesitter")
require("0xahmad.nvim-dir-tree")
require("0xahmad.snippies")
require("0xahmad.bufferline")
require("0xahmad.colorizer")
require("0xahmad.telescope")
require("0xahmad.tab9")
require("0xahmad.lspee")
require("0xahmad.cmpee")

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
