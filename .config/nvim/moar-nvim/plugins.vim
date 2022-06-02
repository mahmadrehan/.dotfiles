" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Base LSPee stuff
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    "Plug 'saadparwaiz/cmp_luasnip'

    " Stuff related to LSP
    Plug 'glepnir/lspsaga.nvim'
    Plug 'onsails/lspkind-nvim'
    Plug 'simrat39/symbols-outline.nvim'
    Plug 'Pocco81/DAPInstall.nvim'
    Plug 'szw/vim-maximizer'

    " A pair of autocomplete OP AI
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    Plug 'github/copilot.vim'

    " snippet related
    Plug 'L3MON4D3/LuaSnip'
    Plug 'ellisonleao/carbon-now.nvim'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'natebosch/dartlang-snippets'

    " Language specific
    " Lua
    Plug 'nvim-lua/lsp_extensions.nvim'

    " Emmet HTML/JSX
    Plug 'mattn/emmet-vim'
    Plug 'alvan/vim-closetag'

    " TypeScript
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

    " TS -> Prisma
    Plug 'pantharshit00/vim-prisma'

    " Dart / Flutter
    Plug 'akinsho/flutter-tools.nvim'
    Plug 'dart-lang/dart-vim-plugin'

    " Python
    " Plug 'psf/black', { 'branch': 'stable' }

    " Java (yes)
    Plug 'mfussenegger/nvim-jdtls'

    " for somewhat global formatting, linting etc.
    Plug 'jose-elias-alvarez/null-ls.nvim'

    " Formatters
    Plug 'sbdchd/neoformat'
    Plug 'prettier/vim-prettier', { 'do': 'pnpm install --frozen-lockfile --prod' }

    " Git
    Plug 'tpope/vim-fugitive'

    " For Visulaizing Vim Marks
    Plug 'kshenoy/vim-signature'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && pnpm install'  }

    " Nvim Tree Shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    " uncategorized utility plugins
    Plug 'preservim/nerdcommenter'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-projectionist'
    Plug 'nvim-lua/popup.nvim'

    " for showing opened files in a fance manner
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

    " directory tree stuff
    Plug 'kyazdani42/nvim-tree.lua'

    " debugging
    Plug 'nvim-lua/plenary.nvim'
    Plug 'mfussenegger/nvim-dap'

    " Telescope, aka slick search and destroy (kode)
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'sharkdp/fd'

    " Smooth movement
    Plug 'psliwka/vim-smoothie'
    Plug 'phaazon/hop.nvim'

    " better syntax support
    Plug 'sheerun/vim-polyglot'

    " ----------------
    " ricing related, cus hey why not
    " ----------------
    " themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'luisiacc/gruvbox-baby'
    " devicons
    Plug 'kyazdani42/nvim-web-devicons'
    " for custom theming
    Plug 'tjdevries/colorbuddy.vim'

call plug#end()


