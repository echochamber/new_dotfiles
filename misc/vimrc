set nocompatible   " Disable vi-compatibility
set nu

" Swap files out of the project root
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'
" My Plugins

    " Color Scheme
    Plugin 'flazz/vim-colorschemes'
    
    " Dockerfile syntax highlighting
    Plugin 'ekalinin/Dockerfile.vim'
    
    "Color scheme
    Plugin 'chriskempson/base16-vim'

    " Airline
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'


    "Nerdtree Folder Management
    Plugin 'scrooloose/nerdtree'

    "Rust and rust autocompletion
    Plugin 'wting/rust.vim'
    Plugin 'phildawes/racer'

    "C++ automcompetion and gutter compiler errors/warnings
    " Plugin 'Valloric/YouCompleteMe'
    
    Plugin 'vim-syntastic/syntastic'

    " Typscript
    Plugin 'leafgarland/typescript-vim'


    " Toml
    Plugin 'cespare/vim-toml' 

    " Swift
    Plugin 'keith/swift.vim'
call vundle#end()



" Enable plugins determining to run of specific filetypes
filetype plugin on

" Theme options --------------------------------------
set t_Co=256
colorscheme xoria256
syntax enable
set guifont=Menlo\ 16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15


" Saner defaults -------------------------------------
set hidden
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeoutlen=1000 ttimeoutlen=0
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set tags=tags

" Copied from sensible.vim
set scrolloff=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

highlight Search cterm=underline


" Key Mappings ---------------------------
let mapleader = ","
let g:mapleader = ","

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Clear search highlights
nmap <Leader>/ :let @/ =""<cr>

" Quickly go forward or backward to buffer
nmap <Leader>b :bm<cr>
nmap <Leader>n :bn<cr>
nmap <Leader>x :bd<cr>


" Nerdtree
nmap <C-n> :NERDTreeToggle<cr>

"pastemode
set pastetoggle=<F2>

" Plugin Settings ------------------------

" airline plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" rust stuff
let g:ycm_rust_src_path = '/Users/jasonschein/Code/external_stuff/rust/rustlang/src'
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']

" YCM python interpreter
" let g:python3_host_prog = '/usr/local/bin/python3'


" Language Specific Settings -------------

" Auto-remove trailing spaces
autocmd Filetype c,cpp,php,rs,java,py BufWritePre <buffer> :%s/\s\+$//e

au BufRead,BufNewFile *.md setlocal textwidth=120
au FileType yaml setlocal tabstop=2 shiftwidth=2
