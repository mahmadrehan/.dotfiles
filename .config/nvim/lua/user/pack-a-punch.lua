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
	use("nvim-lua/plenary.nvim")

	-- base required stuff
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("kdheepak/cmp-latex-symbols")

	use("zbirenbaum/copilot.lua")
	-- use("github/copilot.vim")

	use("nvim-pack/nvim-spectre")

	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- popup ui rendering
	use("MunifTanjim/nui.nvim")
	use("nvim-neo-tree/neo-tree.nvim")

	-- for somewhat global formatting, linting etc.
	use("jose-elias-alvarez/null-ls.nvim")

	-- Harpoon man
	use({ "ThePrimeagen/harpoon", branch = "harpoon2" })


	-- for playing sherlock with the code
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("smartpde/telescope-recent-files")

	use("sharkdp/fd")
	use("mbbill/undotree")
	use("sheerun/vim-polyglot")

	-- language focused plugins
	use("nvim-lua/lsp_extensions.nvim")
	use("folke/lua-dev.nvim") -- for giving completions for the nvim lua api
	use({ "mattn/emmet-vim", ft = { "html", "jsx", "tsx", "rust" } })
	use({ "pantharshit00/vim-prisma", ft = { "prisma", "ts", "js" } })
	use({ "dart-lang/dart-vim-plugin", ft = { "dart" } })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"NeogitOrg/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	})
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

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = { "SmiteshP/nvim-navic" },
	})

	-- INFO: Giving some urgonomiks / flashiness
	-- ------------------------------------------

	use("kyazdani42/nvim-web-devicons")
	use("norcalli/nvim-colorizer.lua") -- for showing colors for hex codes
	use("lukas-reineke/indent-blankline.nvim")

	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "rebelot/kanagawa.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- The END, this marks the end of packing some punch in the editor --
	--
end)
