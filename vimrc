" =======================================================
" GENERAL
" =======================================================

set nocompatible           " Disable compatibility with vi which can cause unexpected issues.
filetype on                " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on         " Enable plugins and load plugin for the detected file type.
filetype indent on         " Load an indent file for the detected file type.
set number relativenumber  " Add numbers to each line on the left-hand side.
set cursorline             " Highlight cursor line underneath the cursor horizontally.
set tabstop=4              " Set tab width to 4 columns.
" set softtabstop=0 noexpandtab
set shiftwidth=4
set expandtab
set nobackup               " Do not save backup files.
set scrolloff=10           " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap                 " Do not wrap lines. Allow long lines to extend as far as the line goes.
set incsearch              " While searching though a file incrementally highlight matching characters as you type.
set ignorecase             " Ignore capital letters during search.
set showcmd                " Show partial command you type in the last line of the screen.
set showmode               " Show the mode you are on the last line.
set showmatch              " Show matching words during a search.
set hlsearch               " Use highlighting when doing a search.
set history=1000           " Set the commands to save in history default number is 20.
set updatetime=100
nnoremap <SPACE> <Nop>     " Ensure space does not have a mapping
let mapleader=" "          " Set leader key to space

" =======================================================
" MENU AUTOCOMPLETE 
" =======================================================
set wildmenu               " Enable auto completion menu after pressing TAB.
set wildmode=list:longest  " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" =======================================================
" PLUGINS
" =======================================================
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'tomasiser/vim-code-dark'
  Plug 'preservim/nerdtree'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'https://github.com/tenable/vim-nasl'
  Plug 'https://github.com/pangloss/vim-javascript'
  Plug 'kdheepak/lazygit.nvim'
call plug#end()


" =======================================================
" MAPPINGS
" =======================================================
" map_mode <what_you_type> <what_is_executed>
nnoremap n nzz
nnoremap N Nzz

 " NerdTree Remaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Telescope Remaps
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>

" Vim Prettier
let g:prettier#autoformat = 1
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'

" LazyGit remaps
nnoremap <silent> <leader>gg :LazyGit<CR>

" Close all buffers but current
map <leader>o :%bd\|e#\|bd#

" Abbreviations
inoreabbrev lii log.info("*** $1 ***", $1,^M^M);^[3hh

" =======================================================
" VIM SCRIPTS
" =======================================================
augroup filetype_vim       " This enables folding using the marker method
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

augroup numbertoggle       " Set the line numbers when in insert mode, relative numbers when in normal mode
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" =======================================================
" STATUS LINE
" =======================================================
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" =======================================================
" MISC
" =======================================================
set noswapfile

" =======================================================
" STYLING (This has to be at the end in order to load correctly)
" =======================================================
colorscheme codedark
set background=dark
