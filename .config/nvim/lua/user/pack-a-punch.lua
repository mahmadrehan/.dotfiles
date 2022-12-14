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

	-- popup ui rendering or something
	use("MunifTanjim/nui.nvim")

	-- base required stuff
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	use({ "github/copilot.vim" })

	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("nvim-lua/plenary.nvim")

	-- use("Pocco81/DAPInstall.nvim")
	use("mfussenegger/nvim-dap")

	use({ "akinsho/toggleterm.nvim", tag = "*" })
	-- vscode habits die hard
	use("nvim-neo-tree/neo-tree.nvim")

	-- Nvim Tree Shitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- for somewhat global formatting, linting etc.
	use("jose-elias-alvarez/null-ls.nvim")

	-- Harpoon man
	use("ThePrimeagen/harpoon")
	-- VSCode habits die hard...
	-- use({ "noib3/cokeline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- for playing sherlock with the code
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("smartpde/telescope-recent-files")
	use("sharkdp/fd")

	use("mbbill/undotree")

	use("sheerun/vim-polyglot")

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
	use("simrat39/rust-tools.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	-- use("tpope/vim-fugitive")

	-- For Visulaizing Vim Marks
	use("kshenoy/vim-signature")

	use("numToStr/Comment.nvim")
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- -------------------------------
	-- Giving some urgonomiks / flashiness
	-- ------------------------------

	use("norcalli/nvim-colorizer.lua") -- for showing colors for hex codes
	use("lukas-reineke/indent-blankline.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "folke/tokyonight.nvim", branch = "main" })
	use("kyazdani42/nvim-web-devicons")
	-- use("mvllow/modes.nvim")

	-- The END, this marks the end of packing some punch in the editor --
end)
