" Basic configurations
set hidden                              " Required to keep multiple buffers open multiple buffers set autoread
set autoread                            " auto update buffer
set autowrite                           " auto update buffer
set gdefault                            " global search by default
set ignorecase                          " ignore case search
set smartcase                           " override ignorecase if search uppercase pattern
set path=$PWD/**
set encoding=utf-8                      " the encoding displayed
set fileencoding=utf-8                  " the encoding written to file
set ruler                               " show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
" set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set number                              " Line numbers
" set relativenumber                      " Relative line numbers
set cursorline                          " Enable highlighting of the current line
set laststatus=2                        " Let lightline handle status line
set showtabline=1                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set noswapfile                          " This is recommented by coc
set nostartofline                       " Move cursor more freedom
set nowrap                              " Display long lines as just one line
set pumheight=10                        " Makes popup menu smaller
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set shortmess+=c                        " Shut off completion messages
set signcolumn=yes                      " Always show the signcolumn
set clipboard=unnamedplus               " Copy paste between vim and everything else
set fillchars+=vert:\ ,stl:\ ,stlnc:\   " Oldshcool style
set list
set listchars=tab:→\ ,trail:·,nbsp:·
" set guicursor=i-ci-ve:Cursor,r-cr-o:DiffDelete
" set guicursor+=i-ci-ve:blinkwait700-blinkoff400-blinkon250
" set guicursor+=a:block
set colorcolumn=100

let g:mapleader=' '
let plugin_dir=stdpath('data') . '/plugged'
let config_dir=stdpath('config') . '/modules'
let g:python_host_prog='/home/murin/.pyenv/versions/pynvim2/bin/python'
let g:python3_host_prog='/home/murin/.pyenv/versions/pynvim3/bin/python'

" Plugins
call plug#begin(plugin_dir)
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'mhinz/vim-startify', { 'branch': 'center' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'mattn/emmet-vim'
Plug 'vifm/vifm.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" Plugins Configuration
source $HOME/.config/nvim/modules/rooter.vim
source $HOME/.config/nvim/modules/vista.vim
source $HOME/.config/nvim/modules/coc.vim
source $HOME/.config/nvim/modules/theme.vim
source $HOME/.config/nvim/modules/fzf.vim
source $HOME/.config/nvim/modules/vifm.vim
source $HOME/.config/nvim/modules/emmet.vim


" Key Bindings

" My hand too lazy to reach Esc
inoremap <silent> kj <Esc>

" Execute python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Better tabbing
vnoremap L >gv
vnoremap H <gv
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Better window navigation
nnoremap <silent><C-h> :wincmd h<cr>
nnoremap <silent><C-j> :wincmd j<cr>
nnoremap <silent><C-k> :wincmd k<cr>
nnoremap <silent><C-l> :wincmd l<cr>
" Use alt + hjkl to resize windows
nnoremap <M-k> :resize -2<CR>
nnoremap <M-j> :resize +2<CR>
nnoremap <M-l> :vertical resize -2<CR>
nnoremap <M-h> :vertical resize +2<CR>
" Switch between vertical and horizontal
nnoremap <leader>sh <C-w>t<C-w>K
nnoremap <leader>sv <C-w>t<C-w>H
" Scroll more faster
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

tnoremap <Esc> <C-\><C-n>
nnoremap <leader><bs> :nohlsearch<cr>

" Functions
nnoremap <leader>e :FloatermNew vifm<cr>
nnoremap <leader>t :FloatermToggle<cr>
nnoremap <leader>f :Files<CR>
nnoremap <leader><tab> :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>q :Vista!!<CR>
nnoremap <leader>m :Marks<CR>
