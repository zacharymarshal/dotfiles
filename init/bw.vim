" Vim color file
" Maintainer:   Hans Fugal <hans@fugal.net>
" Last Change:  5 Oct 2001
" URL:		http://fugal.net/vim/colors/bw.vim

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
"
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="bw"

hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#3d3f49 gui=NONE
hi Comment        ctermfg=NONE
hi Constant       ctermfg=NONE
hi DiffAdd        ctermfg=NONE
hi DiffChange     ctermfg=NONE
hi DiffDelete     ctermfg=NONE
hi DiffText       ctermfg=NONE
hi Directory      ctermfg=NONE
hi Error          ctermfg=NONE
hi ErrorMsg       ctermfg=NONE
hi FoldColumn     ctermfg=NONE
hi Folded         ctermfg=NONE
hi Identifier     ctermfg=NONE
hi Ignore         ctermfg=NONE
hi IncSearch ctermfg=17 ctermbg=215 cterm=none guifg=#282a36 guibg=#ffb86c gui=none
hi LineNr         ctermfg=NONE
hi ModeMsg        ctermfg=NONE
hi MoreMsg        ctermfg=NONE
hi NonText        ctermfg=NONE
hi PreProc        ctermfg=NONE
hi Question       ctermfg=NONE
hi Search ctermfg=17 ctermbg=84 cterm=none guifg=#282a36 guibg=#50fa7b gui=none
hi Special        ctermfg=NONE
hi SpecialKey     ctermfg=NONE
hi Statement      ctermfg=NONE
hi StatusLine     ctermfg=NONE
hi StatusLineNC   ctermfg=NONE
hi Title          ctermfg=NONE
hi Todo           ctermfg=NONE
hi Type           ctermfg=NONE
hi Underlined     ctermfg=NONE
hi VertSplit      ctermfg=NONE
hi Visual         ctermfg=NONE
hi VisualNOS      ctermfg=NONE
hi WarningMsg     ctermfg=NONE
hi WildMenu       ctermfg=NONE
