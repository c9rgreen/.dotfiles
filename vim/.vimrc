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

if has('gui_running')
  " macOS specific
  if has('gui_macvim')
    function! MacAppearance()
      if v:os_appearance == 1
        set background=dark
        colorscheme xcodedark
        let g:airline_theme = "xcodedark"
      else
        set background=light
        colorscheme xcodelight
        let g:airline_theme = "xcodelight"
      endif
    endfunction

    set guifont=SFMono-Regular:h12
    let macvim_hig_shift_movement = 1

    inoremap <D-[> <C-d>
    inoremap <D-]> <C-t>
    nnoremap <D-[> <<
    nnoremap <D-]> >>
    vnoremap <D-[> <<
    vnoremap <D-]> >>

    augroup LookandFeel
      autocmd!
      autocmd OSAppearanceChanged * call MacAppearance()
      autocmd VimEnter * highlight Visual guibg=MacSelectedTextBackgroundColor
      autocmd VimEnter * highlight Comment gui=italic
      autocmd ColorScheme * highlight EndOfBuffer guifg=bg
    augroup END
  endif
else
  colorscheme default
endif

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

" Autocommands
augroup Writing
    autocmd!
    autocmd FileType text,rst,markdown setlocal spell
    autocmd FileType text,rst,markdown setlocal nosmartindent
    autocmd FileType text setlocal foldmethod=indent
    autocmd FileType text,rst,markdown nnoremap <CR> :e <cfile><CR>
    autocmd FileType text,rst,markdown nnoremap <BS> :bp<CR>
    autocmd Syntax markdown syn match markdownUnderscoreNoop /_/
    autocmd FileType text,rmd,rst,markdown setlocal foldcolumn=0
    autocmd BufRead,BufNewFile *.otl   setfiletype votl
augroup END

augroup FrontEnd
    autocmd!
    autocmd FileType javascript set filetype=javascript.jsx
augroup END

" augroup FileBrowser
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

augroup TurnOffColors
  autocmd!
  autocmd BufEnter * syntax off
augroup END
