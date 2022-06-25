" PLUGINS
call plug#begin('~/.local/share/nvim/plugin/')
" Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'simrat39/symbols-outline.nvim'

" Cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Snippets
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'

" Integration
"Plug 'tpope/vim-fugitive'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'goerz/jupytext.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Navigation
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-telescope/telescope-media-files.nvim'
"Plug 'mbbill/undotree'

" Automation
Plug 'lyokha/vim-xkbswitch'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'windwp/nvim-autopairs'
"Plug 'windwp/nvim-ts-autotag'
"Plug 'andymass/vim-matchup'
Plug 'Pocco81/AutoSave.nvim'

" Interface
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'norcalli/nvim-colorizer.lua'

" Colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'EdenEast/nightfox.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'Everblush/everblush.vim'
Plug 'FrenzyExists/aquarium-vim'
Plug 'catppuccin/nvim'
Plug 'rose-pine/neovim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'bkegley/gloombuddy'
Plug 'marko-cerovac/material.nvim'
Plug 'yashguptaz/calvera-dark.nvim'
Plug 'shaunsingh/moonlight.nvim'
call plug#end()


" True Colors
set termguicolors


" LUA
lua require("shket")
