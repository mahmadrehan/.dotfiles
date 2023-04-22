local ok, lsaga = pcall(require, "lspsaga")
if not ok then
	return
end

-- this dude also gives the bulbs
lsaga.setup({
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = " ",
		show_file = true,
		click_support = false,
	},
	ui = {
		-- -- currently only round theme
		-- theme = "round",
		-- -- this option only work in neovim 0.9
		-- title = true,
		-- -- border type can be single,double,rounded,solid,shadow.
		-- border = "rounded",
		-- winblend = 5,
		-- expand = "",
		-- collapse = "",
		-- preview = " ",
		-- code_action = "❔",
		-- diagnostic = "👀",
		-- incoming = " ",
		-- outgoing = " ",
		-- colors = {
		-- 	--float window normal background color
		-- 	normal_bg = "#1A1A29",
		-- 	--title background color
		-- 	title_bg = "#3ddc84",
		-- 	red = "#e95678",
		-- 	magenta = "#b33076",
		-- 	orange = "#FF8700",
		-- 	yellow = "#f7bb3b",
		-- 	green = "#afd700",
		-- 	cyan = "#36d0e0",
		-- 	blue = "#61afef",
		-- 	purple = "#CBA6F7",
		-- 	white = "#efefef",
		-- 	black = "#010101",
		-- },
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
})

Remap = require("user.keymap")
local nnoremap = Remap.nnoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { silent = true }

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client, _)
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			-- local is_async = "false"
			-- local function has_value(tab, val)
			-- 	for _, value in ipairs(tab) do
			-- 		if value == val then
			-- 			return true
			-- 		end
			-- 	end
			-- 	return false
			-- end
			-- if has_value({ "pyright" }, client.name) then
			-- 	is_async = "true"
			-- end
			-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = " .. is_async .. "})")

			nnoremap("K", function()
				vim.cmd("Lspsaga hover_doc")
				-- vim.lsp.buf.hover()
			end, opts)
			nnoremap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			nnoremap("<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
			nnoremap("]d", function()
				vim.cmd("Lspsaga diagnostic_jump_next")
			end, opts)
			nnoremap("[d", function()
				vim.cmd("Lspsaga diagnostic_jump_prev")
			end, opts)
			nnoremap("<leader>vrn", function()
				vim.cmd("Lspsaga rename")
			end, opts)
			nnoremap("<leader>ca", function()
				vim.cmd("Lspsaga code_action")
			end, opts)
			nnoremap("<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			nnoremap("<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	}, _config or {})
end

local ok, nls = pcall(require, "null-ls")

if not ok then
	return
end

local nlsb = nls.builtins

nls.setup(config({
	sources = {
		-- diagnostics
		-- nlsb.diagnostics.protolint,
		nlsb.diagnostics.tsc,
		nlsb.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "mysql" },
		}),
		-- formatters
		nlsb.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mysql" },
		}),
		nlsb.formatting.gofmt,
		nlsb.formatting.stylua,
		nlsb.formatting.prettierd,
		nlsb.formatting.rustfmt,
		nlsb.formatting.zigfmt,
		nlsb.formatting.markdownlint,
		nlsb.formatting.black,
		nlsb.formatting.shfmt,
		nlsb.formatting.xmlformat,
	},
}))

-- Dart
require("lspconfig").dartls.setup(config())
-- python
require("lspconfig").pyright.setup(config())

-- GoLang
require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
			codelenses = {
				gc_details = true,
			},
		},
	},
}))
require("lspconfig").lua_ls.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))
require("lspconfig").rust_analyzer.setup(config({
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
				unimportedPackages = "off",
			},
			cargo = { loadOurDirsFromCheck = true },
			procMacro = { enable = true },
		},
	},
}))

-- java does not work yet........ (-_-)
require("lspconfig").jdtls.setup(config())
--------------------------------------------
-- require("lspconfig").ccls.setup(config()) -- c/cpp
require("lspconfig").clangd.setup(config())
require("lspconfig").zls.setup(config())
require("lspconfig").solang.setup(config())
-- INFO: frontend focused
-- JS/TS
require("lspconfig").tsserver.setup(config({
	-- root_dir = require("lspconfig.util").root_pattern(".git"),
}))
require("lspconfig").html.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").astro.setup(config({
	filetypes = { "astro" },
}))
require("lspconfig").prismals.setup(config({
	filetypes = { "prisma" },
	cmd = { "prisma-language-server", "--stdio" },
}))
require("lspconfig").tailwindcss.setup(config({
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)",  "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "tv\\(([^)]*)\\)",   "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "clsx\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
}))
-- require("lspconfig").graphql.setup(config())
require("lspconfig").svelte.setup(config())
-- other
require("lspconfig").bashls.setup(config())
require("lspconfig").dockerls.setup(config())
require("lspconfig").ansiblels.setup(config())
require("lspconfig").bufls.setup(config())
