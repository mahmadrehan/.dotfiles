local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("[-] Packer crashed")
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- base lsp stuff
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("lewis6991/gitsigns.nvim")
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- use("Pocco81/DAPInstall.nvim")
	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-dap")

	-- HARPOON MAN
	use("ThePrimeagen/harpoon")

	-- ** Language specific ** --
	-- Lua
	use("nvim-lua/lsp_extensions.nvim")
	-- Emmet HTML/JSX
	use({ "mattn/emmet-vim", ft = { "html", "jsx", "tsx", "rust" } })
	use({ "alvan/vim-closetag", ft = { "html", "jsx", "tsx", "rust" } })
	-- TypeScript
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", ft = { "ts", "js" } })
	-- use({ "MunifTanjim/prettier.nvim" })
	-- Prisma / TS
	use({ "pantharshit00/vim-prisma", ft = { "prisma", "ts", "js" } })
	-- Dart / Flutter
	-- use({ "akinsho/flutter-tools.nvim", ft = { "dart" } })
	use({ "dart-lang/dart-vim-plugin", ft = { "dart" } })

	-- for somewhat global formatting, linting etc.
	use("jose-elias-alvarez/null-ls.nvim")

	-- for quicker commenting
	use("numToStr/Comment.nvim")

	-- java (yes)
	use("mfussenegger/nvim-jdtls")

	-- Git (todo, will find a better solution for my style soon[when I open this hopefully next lol])

	-- For Visulaizing Vim Marks
	use("kshenoy/vim-signature")

	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" }) -- Nvim Tree Shitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- uncategorized utility plugins
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")

	-- statusbar madness
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- directory tree stuff
	use("nvim-neo-tree/neo-tree.nvim")
	use("MunifTanjim/nui.nvim")

	-- for playing sherlock with the code
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("sharkdp/fd")

	-- better syntax support
	use("sheerun/vim-polyglot")
	use({ "earthly/earthly.vim", branch = "main" })

	-- -------------------------------
	-- Giving some urgonomiks / flashiness
	-- ------------------------------

	use({ "akinsho/bufferline.nvim", tag = "*" })

	use("ellisonleao/gruvbox.nvim")
	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "catppuccin/nvim", branch = "main", as = "catppuccin" })
	use("mvllow/modes.nvim")
	-- icons, beacuse my eyes are too used to seeing them from VSKode
	use("kyazdani42/nvim-web-devicons")

	-- I guess this marks the end of packing some punch in the editor --
end)
