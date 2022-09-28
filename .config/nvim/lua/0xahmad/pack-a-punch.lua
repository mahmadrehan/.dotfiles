local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("[-] Packer is not starting up")
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
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("nvim-lua/plenary.nvim")
	-- use("Pocco81/DAPInstall.nvim")
	use("mfussenegger/nvim-dap")
	-- Nvim Tree Shitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	-- for somewhat global formatting, linting etc.
	use("jose-elias-alvarez/null-ls.nvim")
	-- HARPOON MAN
	use("ThePrimeagen/harpoon")

	--
	-- ** Language specific ** --
	--
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
	-- java (yes)
	use("mfussenegger/nvim-jdtls")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	-- For Visulaizing Vim Marks
	use("kshenoy/vim-signature")

	-- for quicker commenting
	use("numToStr/Comment.nvim")

	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })

	-- better syntax support
	use("sheerun/vim-polyglot")

	-- statusbar madness
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- directory tree stuff
	use("nvim-neo-tree/neo-tree.nvim")
	use("MunifTanjim/nui.nvim")

	-- for playing sherlock with the code
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("sharkdp/fd")

	-- -------------------------------
	-- Giving some urgonomiks / flashiness
	-- ------------------------------

	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use("EdenEast/nightfox.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "folke/tokyonight.nvim", branch = "main" })
	use("mvllow/modes.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- I guess this marks the end of packing some punch in the editor --
end)
