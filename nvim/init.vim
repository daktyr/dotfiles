" ------------------------------------------------------------------------------
" General
" ------------------------------------------------------------------------------

set nocompatible
set encoding=utf8
syntax on
filetype plugin indent on
set mouse=""
let mapleader = ","
set ruler
set hidden
set nocursorline
set ttyfast " speed up vim
set re=1 " speed up vim
set number
set noswapfile
set nobackup
set nofoldenable
set scrolloff=8
set backspace=indent,eol,start
set visualbell
set noerrorbells
set splitright
set splitbelow
let html_no_rendering=1
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set fillchars=""
set autoindent
set copyindent
set showmatch
set textwidth=80
set colorcolumn=+1
set clipboard=unnamed
set formatoptions=tcrq
set title
set termguicolors
set inccommand=split
set grepprg=rg\ --vimgrep

autocmd BufWritePre * %s/\s\+$//e
" fix syntax highlighting for slim
" autocmd BufNewFile,BufRead *.slim set ft=slim
autocmd FileType javascript inoremap cl<tab> console.log();<left><left>
autocmd FileType javascript inoremap db<tab> debugger;
autocmd FileType ruby inoremap bp<tab> binding.pry
autocmd FileType elixir inoremap ip<tab> require IEx; IEx.pry

" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nmap     <C-c> <esc>
vnoremap <C-c> <esc>
cnoremap <C-c> <esc>
inoremap <C-c> <esc>
tnoremap <A-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <A-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <A-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <A-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <A-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
tnoremap <esc> <C-\><C-n>
tnoremap <A-[> <Esc>
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
nnoremap <F7> mzgg=G`z
noremap <Up> :res +1<CR>
noremap <Down> :res -1<CR>
noremap <Left> :vertical resize -1<CR>
noremap <Right> :vertical resize +1<CR>
cmap w!! w !sudo tee % >/dev/null
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" install vim-plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'docunext/closetag.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'pbrisbin/vim-mkdir'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'
Plug 'janko-m/vim-test'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-slash'
Plug 'farmergreg/vim-lastplace'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'danro/rename.vim'

call plug#end()

" ------------------------------------------------------------------------------
" indentLine
" ------------------------------------------------------------------------------

let g:indentLine_char = '¦'

" ------------------------------------------------------------------------------
" Fzf
" ------------------------------------------------------------------------------

let FZF_DEFAULT_COMMAND='rg --files --hidden'
let g:fzf_layout = { 'down': '~27%' }

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --hidden --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)

" ------------------------------------------------------------------------------
" Ale
" ------------------------------------------------------------------------------

" wait a bit before checking syntax in a file, if typing
let g:ale_lint_delay = 1000
" use global eslint
let g:ale_javascript_eslint_use_global = 1
" only use es6 for js
let g:ale_linters = {'javascript': ['eslint']}
" always keep opened sign column
let g:ale_sign_column_always = 1
let g:ale_set_signs = 1
let g:ale_set_highlights = 0

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------

let NERDTreeShowHidden=1

" ------------------------------------------------------------------------------
" Deoplete
" ------------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10
" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ------------------------------------------------------------------------------
" Tests
" ------------------------------------------------------------------------------

let test#strategy = "neovim"
" command! -nargs=* DockerTests let test#ruby#rspec#executable = 'rspec'

" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------

set background=dark
color tomorrow-night-eighties
" base16-default-dark, base16-eighties, base16-harmonic16-dark,
" base16-monokai, base16-ocean, base16-railscasts, base16-tomorrow, base16-ashes

" ------------------------------------------------------------------------------
" Status line
" ------------------------------------------------------------------------------

set laststatus=2
set statusline=\ %f\ %{fugitive#statusline()}%m%r
set statusline+=%=\ %l/%L:%c\ [%P]\ [%{strlen(&fenc)?&fenc:'none'}]%y

" ------------------------------------------------------------------------------
" Terminal
" ------------------------------------------------------------------------------

let g:terminal_color_0 = '#000000'
let g:terminal_color_1 = '#c37372'
let g:terminal_color_2 = '#72c373'
let g:terminal_color_3 = '#c2c372'
let g:terminal_color_4 = '#7372c3'
let g:terminal_color_5 = '#c372c2'
let g:terminal_color_6 = '#72c2c3'
let g:terminal_color_7 = '#d9d9d9'
let g:terminal_color_8 = '#323232'
let g:terminal_color_9 = '#dbaaaa'
let g:terminal_color_10 = '#aadbaa'
let g:terminal_color_11 = '#dadbaa'
let g:terminal_color_12 = '#aaaadb'
let g:terminal_color_13 = '#dbaada'
let g:terminal_color_14 = '#aadadb'
let g:terminal_color_15 = '#ffffff'
