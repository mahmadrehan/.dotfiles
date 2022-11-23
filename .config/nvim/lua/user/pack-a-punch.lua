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
	use({ "wbthomason/packer.nvim" })

	-- for performance reasons
	use({ "lewis6991/impatient.nvim" })

	-- base required stuff
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("nvim-lua/plenary.nvim")

	-- use("Pocco81/DAPInstall.nvim")
	use("mfussenegger/nvim-dap")

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Nvim Tree Shitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	use("simrat39/symbols-outline.nvim")

	-- for somewhat global formatting, linting etc.
	use("jose-elias-alvarez/null-ls.nvim")

	-- Harpoon man
	use("ThePrimeagen/harpoon")
	-- VSCode habits die hard...
	use({ "noib3/cokeline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- for playing sherlock with the code
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("smartpde/telescope-recent-files")
	use("sharkdp/fd")

	use("mbbill/undotree")

	--
	-- ** Language specific ** --
	--
	-- Lua
	use("nvim-lua/lsp_extensions.nvim")
	use("folke/lua-dev.nvim") -- for giving completions for the nvim lua api
	-- Emmet HTML/JSX
	use({ "mattn/emmet-vim", ft = { "html", "jsx", "tsx", "rust" } })
	-- TypeScript
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", ft = { "ts", "js" } })
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

	-- commenting
	use("numToStr/Comment.nvim")
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })

	-- better syntax support
	use("sheerun/vim-polyglot")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- for rendering popups n stuff
	use("MunifTanjim/nui.nvim")
	-- directory tree stuff
	use("nvim-neo-tree/neo-tree.nvim")

	-- -------------------------------
	-- Giving some urgonomiks / flashiness
	-- ------------------------------

	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "folke/tokyonight.nvim", branch = "main" })
	use("mvllow/modes.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- I guess this marks the end of packing some punch in the editor --
end)
