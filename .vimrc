filetype plugin indent on
syntax enable
colorscheme solarized8

" Options
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
set statusline=
set statusline+=%<[%{fnamemodify(getcwd(),':t')}]
set statusline+=\ %f
set statusline+=%=
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
set statusline+=\ [wc%{wordcount().words}]
set autoread
set spelllang=en_us
set sidescrolloff=0
set scrolloff=5
set tags^=./.git/tags
set laststatus=2
set foldlevel=5
set virtualedit=all
set isfname+=32
set belloff+=ctrlg
set mouse=a
set number
set ttyfast
set ttimeoutlen=100
set linespace=1

" Use <space> instead of <\> as the leader key
let mapleader = "\<Space>"

" Commands
command! Bd :bn | :bd#
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Abbreviations
iabbrev <expr> :date: strftime("%Y-%m-%d")
iabbrev <expr> [[]] strftime("[[%Y%m%d%H%M%S]]")

" Mappings
noremap <silent> k gk
noremap <silent> j gj
vnoremap < <gv
vnoremap > >gv

" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Jump backward
nnoremap <leader>o <C-O>

" Jump forward
nnoremap <leader>i <C-I>

" Go to file
nnoremap <leader>e :edit **/*

" Go to buffer
nnoremap <leader>b :buffer **/*

" Go to tag
nnoremap <leader>a :tag *

" Hard wrap
nnoremap <leader>h gqip$

" CtrlP mappings
nnoremap <leader>p :CtrlP<CR> 
nnoremap <leader>b :CtrlPBuffer<CR> 
nnoremap <leader>t :CtrlPBufTagAll<CR> 

" Vista
nnoremap <leader>v :Vista!!<CR>

" Fern
nnoremap <leader>f :Fern . -drawer -stay -toggle<CR>

" Packages
packadd! matchit

" Variables
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_cursor = 0
let g:markdown_folding = 1
let g:javaScript_fold = 1
let g:mucomplete#enable_auto_at_startup = 1
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'vim_lsp'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }

" Autogroups
augroup fern-custom
  autocmd! *
  autocmd FileType fern setlocal nonumber
augroup END

" Terminal-specific
if has('ttyout')
    let g:solarized_use16 = 1
endif

" MacVim-specific
if has('gui_macvim')
    function! MacAppearance()
        if v:os_appearance == 1
            set background=dark
        else
            set background=light
        endif
    endfunction

    augroup Appearance
        autocmd!
        autocmd OSAppearanceChanged * call MacAppearance()
    augroup END

    set guifont=BerkeleyMono-Regular:h13

    " let macvim_hig_shift_movement=1

    " Indent/Outdent
    inoremap <D-[> <C-d>
    inoremap <D-]> <C-t>
    nnoremap <D-[> <<
    nnoremap <D-]> >>
    vnoremap <D-[> <gv
    vnoremap <D-]> >gv

    " Toggle comments
    inoremap <D-/> <Esc>:Commentary<CR>
    vnoremap <D-/> :Commentary<CR>
    nnoremap <D-/> :Commentary<CR>
endif

