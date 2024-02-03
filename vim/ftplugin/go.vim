let g:go_fmt_command = "goimports"

setlocal listchars=tab:\ \ ,trail:·,nbsp:·
setlocal noexpandtab
setlocal shiftwidth=2
setlocal tabstop=2

nmap <leader>r :GoRename

let g:ale_go_golangci_lint_package = 1
let b:ale_linters = ['golangci-lint']
let b:ale_fixers = []
let g:ale_fix_on_save = 0
