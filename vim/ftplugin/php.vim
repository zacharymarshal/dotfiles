setlocal expandtab
setlocal autoindent
setlocal nocindent
setlocal nosmartindent

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
let b:ale_fixers = ['prettier']
let g:ale_fix_on_save = 1

" " Kelvin stuff
let g:php_cs_fixer_executable = 'docker-compose exec worker php-cs-fixer'
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
