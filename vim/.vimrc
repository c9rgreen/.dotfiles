filetype plugin indent on
syntax enable

set autoindent
set smartindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview
set omnifunc=syntaxcomplete#Complete
set infercase
set nowrap
set linebreak
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
set shortmess+=I
set noswapfile
set showcmd
set hlsearch
set wildmenu
set wildignore+=*.git,*venv/*,*node_modules/*,*vendor/*,*__pycache__/*,*.aux,*.cls,*dist/*,*output/*
set wildignorecase
set autoread
set spelllang=en_us
set sidescrolloff=5
set scrolloff=5
set tags^=./.git/tags
set laststatus=2
set statusline=%<[%{fnamemodify(getcwd(),':t')}]\ %f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V\ %L%)\ %P\ [%{wordcount().words}]
set foldlevel=5
set virtualedit=all
set linespace=1
set thesaurus=~/.vim/thesaurus/mthesaur.txt

colorscheme hemisu

if has('gui_macvim')
  set guifont=SFMono-Regular:h12
  set transparency=5
  augroup LookandFeel
    autocmd VimEnter,ColorScheme,BufEnter,OSAppearanceChanged * if v:os_appearance == 0 | set bg=light | else | set bg=dark | endif
    autocmd VimEnter,ColorScheme,BufEnter * highlight EndOfBuffer guifg=bg
  augroup END
endif

" Mappings
map <Space> <Leader>
nnoremap <leader>o <C-O>
nnoremap <leader>i <C-I>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>e :edit **/*
nnoremap <leader>h gqip$
nnoremap <leader>a :tag *
nnoremap - :Ex<cr>
nnoremap <leader>u :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>s :Gstatus<cr>

" Commands
command! Bd :bn | :bd#
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Abbreviations
ia <expr> :date: strftime("%Y-%m-%d")

" Packages
packadd! matchit
let g:netrw_banner = 0
let g:markdown_folding = 1
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
let g:polyglot_disabled = ['markdown']
let g:ale_completion_enabled=1
let g:ale_completion_tsserver_autoimport=1
set omnifunc=ale#completion#OmniFunc

" Autocommands
augroup Writing
  autocmd FileType text,rst,markdown setlocal spell
  autocmd FileType outlaw setlocal spell
  autocmd BufNewFile,BufRead *.txt setlocal filetype=outlaw
augroup END
