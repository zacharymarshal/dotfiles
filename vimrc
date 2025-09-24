set encoding=utf-8

filetype on
filetype plugin on


" Configure my namespace to be SPACE
let mapleader = " "

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set autowrite
set modelines=0
set nomodeline

" Always show the filename
" set laststatus=2
" set statusline=%t
" set statusline+=%=
" set statusline+=%c,
" set statusline+=%l/%L

" Display characters
set list listchars=tab:»\ ,trail:·,nbsp:·

" Don't go to beginning of line when switching buffers
set nostartofline
" Use one space, not two, after punctuation.
set nojoinspaces
" Numbers
" This sets hybrid where absolute number shows instead of zero
" with relative numbers
set number relativenumber
set numberwidth=5

" Save my life
set autoindent

" highlight while searching
set incsearch
" highlight all matches
set hlsearch

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

" OMG save me from this autocomplete trash
set wildmode=list:longest

" Stupid mouse BS
set mouse=

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax on
colorscheme gruvbox

" Unbind the cursor keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Switch between most recent buffer
nmap <leader>e <c-^>
" Reload vimrc changes
nmap <leader>so :source $MYVIMRC <cr>
" Insert new line after current line
nmap <leader>o o<esc>
" Insert new line before current line
nmap <leader>O O<esc>
" Add semi-colon to end of line
nmap <leader>; m`A;<esc>``
" clear highlight of search
nmap <leader>h :nohlsearch<cr>
" Change single quotes to double
nmap <leader>' cs"'
" Change double quotes to single
nmap <leader>" cs'"

" Open fzf
nmap <leader>p :GFiles<CR>
nmap <leader>pp :Files<CR>
nmap <leader>P :Buffers<CR>
nmap <leader>\ :Ag 

" Toggle numbers and relative numbers
nmap <leader>n :set relativenumber! number!<CR>


imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

autocmd BufNewFile,BufRead *.phtml set filetype=html
autocmd BufNewFile,BufRead *.tmpl set filetype=html
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd BufNewFile,BufRead *.svelte set filetype=svelte

filetype indent off

" Ctags
set tags=./tags,tags,.git/tags

" fzf
let $FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
" let $FZF_DEFAULT_COMMAND = 'ag -l --hidden --ignore .git'
let g:fzf_vim = {}
" fzf disable preview window
let g:fzf_vim.preview_window = []
