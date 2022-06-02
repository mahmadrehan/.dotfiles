let g:mapleader = " "
source $HOME/.config/nvim/moar-nvim/plugins.vim
source $HOME/.config/nvim/moar-nvim/settings.vim
source $HOME/.config/nvim/moar-nvim/remaps.vim
source $HOME/.config/nvim/moar-nvim/nvimtree.vim
source $HOME/.config/nvim/moar-nvim/autoclose-tags.vim
source $HOME/.config/nvim/moar-nvim/configs.vim

colorscheme gruvbox
"lua require("colorbuddy").colorscheme("0xahmad.fleeet")
highlight Normal guibg=none

" Lua scripts
lua require('0xahmad')


