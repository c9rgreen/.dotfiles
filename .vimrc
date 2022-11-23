" Options
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
set linespace=2
set thesaurus=~/.vim/thesaurus/mthesaur.txt
set isfname+=32
set belloff+=ctrlg
set mouse=a
set number
set nocursorline
set ttyfast

" LilyPond plugin
set runtimepath+=/opt/local/share/lilypond/2.22.2/vim
set packpath+=/opt/local/share/vim

" Set map leader to <Space>
let mapleader="\<Space>"

if has('gui_running')
    " macOS specific
    if has('gui_macvim')
        function! MacAppearance()
            if v:os_appearance == 1
                set background=dark
                colorscheme solarized8
            else
                set background=light
                colorscheme solarized8
            endif
        endfunction

        set guifont=BerkeleyMono-Regular:h13

        let macvim_hig_shift_movement = 1

        " Indent/Outdent
        inoremap <D-[> <C-d>
        inoremap <D-]> <C-t>
        nnoremap <D-[> <<
        nnoremap <D-]> >>
        vnoremap <D-[> <gv
        vnoremap <D-]> >gv

        " Toggle comments
        inoremap <D-/> :Commentary<CR>
        vnoremap <D-/> :Commentary<CR>
        nnoremap <D-/> :Commentary<CR>

        augroup LookandFeel
            autocmd!
            autocmd OSAppearanceChanged * call MacAppearance()
            " autocmd VimEnter * highlight Visual guibg=MacSelectedTextBackgroundColor
            autocmd VimEnter * highlight Comment gui=italic
            autocmd ColorScheme * highlight EndOfBuffer guifg=bg
        augroup END
    endif
else
    try
        let g:solarized_use16=1
        let g:solarized_termtrans=1
        let g:solarized_extra_hi_groups=1
        let g:solarized_italics=1
        colorscheme solarized8
    catch
        colorscheme default
    endtry

    augroup Colors
        autocmd!
        autocmd ColorScheme * highlight! link Visual CursorLine
    augroup END
endif

" Abbreviations
iabbrev <expr> :date: strftime("%Y-%m-%d")
iabbrev <expr> [[]] strftime("[[%Y%m%d%H%M%S]]")

" Mappings
noremap <silent> k gk
noremap <silent> j gj
vnoremap < <gv
vnoremap > >gv

" Jump backward
nnoremap <leader>o <C-O>

" Jump forward
nnoremap <leader>i <C-I>

" Edit
nnoremap <leader>e :edit **/*

" Quickly jump to buffer
nnoremap <leader>b :buffer **/*

" Hard wrap
nnoremap <leader>h gqip$

" Go to tag
nnoremap <leader>a :tag *

" Tab through auto-completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" Trigger auto-completion with Ctrl-Space
imap <C-@> <C-Space>

" Open netrw
nnoremap - :Ex<CR>

" Open vimrc
nnoremap <leader>r :e ~/.vimrc<CR>

" Add row of ===== below current line
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 yypVr*

" Fugitive mappings
nnoremap <leader>s :Git<CR>

" Dash mappings
nnoremap <leader>d :Dash<CR>

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
let g:netrw_altv = 1
let g:markdown_folding = 1
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }

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

