" ┌───────────────────────────────────────┐
" │                  Vim                  │
" │            https://vim.org            │
" └───────────────────────────────────────┘

" I use two vim plugins.
" 1. Editorconfig: https://editorconfig.org
" 2. Dim: https://jeffkreeftmeijer.com/vim-16-color/

" Other great Vim colorschemes: https://vimcolorschemes.com

filetype plugin indent on
syntax enable

set autoindent
set smartindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,noselect
set omnifunc=syntaxcomplete#Complete
set infercase
set nowrap
set linebreak
set breakindent
set incsearch
set hidden
set guioptions=mc
set clipboard^=unnamed,unnamedplus
set formatoptions=tcroqjn
set showmatch
set expandtab
set tabstop=4
set shiftwidth=0
set diffopt=vertical
set autowrite
set autowriteall
set shortmess+=Ic
set noswapfile
set showcmd
set hlsearch
set wildmenu
set wildignore+=*.git,*venv/*,*node_modules/*,*vendor/*,*__pycache__/*,*.aux,*.cls,*dist/*,*output/*
set wildignorecase
set autoread
set spelllang=en_us
set sidescrolloff=0
set scrolloff=5
set tags^=./.git/tags
set laststatus=2
set statusline=%<[%{fnamemodify(getcwd(),':t')}]\ %f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V\ %L%)\ %P\ [%{wordcount().words}]
set foldlevel=5
set virtualedit=all
set linespace=1
set thesaurus=~/.vim/thesaurus/mthesaur.txt
set isfname+=32
set belloff+=ctrlg
set mouse=a
set number

colorscheme dim

" Abbreviations
iabbrev ,, <>
iabbrev <expr> :date: strftime("%Y-%m-%d")
iabbrev <expr> [[]] strftime("[[%Y%m%d%H%M%S]]")

" Mappings
noremap <silent> k gk
noremap <silent> j gj
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>o <C-O>
nnoremap <leader>i <C-I>
nnoremap <leader>e :edit **/*
nnoremap <leader>h gqip$
nnoremap <leader>a :tag *

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Commands
command! Bd :bn | :bd#
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Packages
packadd! matchit
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:markdown_folding = 1

" From https://github.com/jeffkreeftmeijer/vim-nightfall
function UpdateBackground()
  if system("defaults read -g AppleInterfaceStyle") == "Dark\n"
    if &bg == "light" | set bg=dark | endif
  else
    if &bg == "dark" | set bg=light | endif
  endif 
endfunction

augroup nightfall
  autocmd!
  autocmd FocusGained,BufEnter * call UpdateBackground()
augroup END

augroup Writing
    autocmd!
    autocmd FileType text,rst,markdown setlocal spell
    autocmd FileType text,rst,markdown setlocal nosmartindent
    autocmd FileType text setlocal foldmethod=indent
    autocmd FileType text,rst,markdown nnoremap <CR> :e <cfile><CR>
    autocmd FileType text,rst,markdown nnoremap <BS> :bp<CR>
    autocmd Syntax markdown syn match markdownUnderscoreNoop /_/
    autocmd FileType text,rmd,rst,markdown setlocal foldcolumn=0
augroup END

augroup FrontEnd
    autocmd!
    autocmd FileType javascript set filetype=javascript.jsx
augroup END
