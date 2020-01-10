set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tpope/vim-eunuch'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'terryma/vim-multiple-cursors'

Plugin 'fatih/vim-go'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'

" Plugin 'StanAngeloff/php.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Unbind the cursor keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Configure my namespace to be SPACE
let mapleader = "\<Space>"

" Switch between most recent buffer
nmap <leader>e <c-^>
" Reload vimrc changes
nmap <leader>so :source $MYVIMRC <cr>
" Insert new line after current line
nmap <leader>o o<esc>
" Insert new line before current line
nmap <leader>O O<esc>
nmap <leader>= =i}
" Paste mode
set pastetoggle=<F2>
" Add semi-colon to end of line
nmap <leader>; m`A;<esc>``

" Apply dot command to visual mode
xnoremap . :normal .<CR>
" Apply macro to visual mode selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Don't update while executing macros
" this keeps my show recent buffers macro workin
set lazyredraw
set hidden                      " Allow buffer change w/o saving
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set showcmd                     " Show commands at the bottom right
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set autowrite
" Always show the filename
set laststatus=2
set statusline=%t
set statusline+=%=
set statusline+=%c,
set statusline+=%l/%L

set nostartofline " Don't go to beginning of line when switching buffers

" Display extra whitespace
set list listchars=tab:\ \ ,trail:•

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Colors
syntax on
color bw
let html_my_rendering=1

" Numbers
set nonumber
set numberwidth=5

" Save my life
set autoindent

" Backups in a tmp directory
set backupdir=~/.tmp
set directory=~/.tmp

" Enable built-in matchit plugin
" Using the % to find the matching brace, tag etc
runtime macros/matchit.vim

" Tabularize (Aligning =>)
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>aa :Tabularize /=><CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" PHP settings
" ------------

augroup filetype_php
  autocmd!
  autocmd BufNewFile,BufRead *.phpt set filetype=php
  autocmd FileType php setlocal syntax=txt shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
augroup END

" HTML settings
" ------------
augroup filetype_html
  autocmd!
  autocmd BufNewFile,BufRead *.phtml set filetype=html
  autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
augroup END

" Git message settings
" --------------------

autocmd Filetype gitcommit setlocal spell textwidth=72

" Markdown settings
" -----------------

autocmd BufNewFile,BufRead *.txt set filetype=markdown

" Go settings
" ------------
augroup filetype_go
  autocmd!
  autocmd BufNewFile,BufRead *.go set filetype=go
  autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

" search settings
" ---------------

set incsearch " highlight while searching
set hlsearch  " highlight all matches

" clear highlight of search
nmap <leader>h :nohlsearch<cr>

set ignorecase " case insensitive search
set smartcase  " case sensitive mode if I put a capital letter

" vim-surround settings
" ---------------------

nmap <leader>' cs"'
nmap <leader>" cs'"

" Dash
" --------------------
nmap <silent> <leader>d <Plug>DashSearch
