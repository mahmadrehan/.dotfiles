local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end
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
		-- nlsb.diagnostics.sqlfluff.with({
		-- 	extra_args = { "--dialect", "mysql" },
		-- }),
		-- nlsb.diagnostics.eslint_d,
		-- formatters
		nlsb.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mysql" },
		}),
		nlsb.formatting.golines.with({
			extra_args = { "-m", "82" },
		}),
		nlsb.formatting.stylua,
		nlsb.formatting.prettierd.with({
			filetypes = {
				"html",
				"css",
				"json",
				"yaml",
				"svelte",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"jsx",
				"tsx",
				"graphql",
				"graphqls",
			},
		}),
		nlsb.formatting.rustfmt,
		nlsb.formatting.zigfmt,
		nlsb.formatting.markdownlint,
		nlsb.formatting.shfmt,
		nlsb.formatting.black.with({
			extra_args = { "--line-length", "82" },
		}),
		nlsb.formatting.xmlformat,
	},
}))

-- Dart
lspconfig.dartls.setup(config())

-- python
-- lspconfig.pyright.setup(config())
lspconfig.pylsp.setup(config({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391", "W503", "E203" },
					maxLineLength = 82,
				},
			},
		},
	},
}))

-- GoLang
lspconfig.gopls.setup(config({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
			gofumpt = true,
			codelenses = { gc_details = true },
		},
	},
}))
lspconfig.lua_ls.setup(config({
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

lspconfig.taplo.setup(config())

lspconfig.rust_analyzer.setup(config({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
			},
		},
	},
}))

-- java does not work yet........ (-_-)
lspconfig.jdtls.setup(config())
--------------------------------------------
-- lspconfig.ccls.setup(config()) -- c/cpp
lspconfig.clangd.setup(config())
lspconfig.zls.setup(config())
lspconfig.solang.setup(config())
-- INFO: frontend focused
-- JS/TS
lspconfig.tsserver.setup(config({}))
lspconfig.html.setup(config())
lspconfig.cssls.setup(config())
lspconfig.astro.setup(config({ filetypes = { "astro" } }))
lspconfig.prismals.setup(config({
	filetypes = { "prisma" },
	cmd = { "prisma-language-server", "--stdio" },
}))

lspconfig.tailwindcss.setup(config({
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

lspconfig.graphql.setup(config())
lspconfig.svelte.setup(config())
-- other
lspconfig.bashls.setup(config())
lspconfig.dockerls.setup(config())
lspconfig.ansiblels.setup(config())
lspconfig.bufls.setup(config())
