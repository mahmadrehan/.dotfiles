local lspsaga = require("lspsaga")
-- this dude also gives the bulbs
lspsaga.init_lsp_saga({
	server_filetype_map = {},
	code_action_lightbulb = {
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
})

Remap = require("0xahmad.keymap")
local nnoremap = Remap.nnoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

		on_attach = function(client, _)
			nnoremap("K", function()
				vim.cmd("Lspsaga hover_doc")
			end)
			nnoremap("<leader>gd", function()
				vim.cmd("Lspsaga lsp_finder")
			end)
			nnoremap("<leader>gr", function()
				vim.cmd("Lspsaga rename")
			end)
			nnoremap("<leader>gp", function()
				vim.cmd("Lspsaga peek_definition")
			end)
			nnoremap("]d", function()
				vim.cmd("Lspsaga diagnostic_jump_next")
			end)
			nnoremap("[d", function()
				vim.cmd("Lspsaga diagnostic_jump_prev")
			end)
			nnoremap("<leader>vca", function()
				vim.cmd("Lspsaga code_action")
			end)
			nnoremap("<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end)

			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local is_async = "false"
			if has_value({ "pyright" }, client.name) then
				is_async = "true"
			end
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = " .. is_async .. "})")
		end,
	}, _config or {})
end

-- Dart
require("lspconfig").dartls.setup(config())
-- require("flutter-tools").setup(config())
-- python
require("lspconfig").pyright.setup(config())
require("lspconfig").jedi_language_server.setup(config())

-- JS/TS
require("lspconfig").tsserver.setup(config({
	-- root_dir = require("lspconfig.util").root_pattern(".git"),
}))

local nls = require("null-ls")
local nlsb = require("null-ls").builtins

nls.setup(config({
	sources = {
		-- go
		nlsb.formatting.gofmt,
		-- lua
		nlsb.formatting.stylua,
		-- js/ts
		nlsb.formatting.prettierd,
		nlsb.diagnostics.eslint_d,
		nlsb.diagnostics.tsc,
		-- rust
		nlsb.formatting.rustfmt,
		-- for zig
		nlsb.formatting.zigfmt,
		-- for markdown
		nlsb.formatting.markdownlint,
		-- nlsb.diagnostics.markdownlint, -- this one was becoming a pain to manage
		-- python
		nlsb.formatting.black,
		-- for shell scripts
		nlsb.formatting.shfmt,
		-- for sql scripts
		nlsb.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
	},
}))

require("lspconfig").svelte.setup(config())
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
-- Lua
require("lspconfig").sumneko_lua.setup(config({
	-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
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
-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
				unimportedPackages = "off",
			},
			cargo = {
				loadOurDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
}))

-- java does not work yet........ (-_-)
require("lspconfig").jdtls.setup(config())
--------------------------------------------
require("lspconfig").ccls.setup(config()) -- c/cpp
require("lspconfig").zls.setup(config())
require("lspconfig").solang.setup(config())
-- frontend focused
require("lspconfig").html.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").tailwindcss.setup(config())
-- other
require("lspconfig").graphql.setup(config())
require("lspconfig").bashls.setup(config())
require("lspconfig").dockerls.setup(config())
require("lspconfig").ansiblels.setup(config())
