local ret_status="%(?:%{$fg_bold[green]%}●:%{$fg_bold[red]%}●)%{$reset_color%}"
PROMPT='${ret_status} %D{%H:%M:%S} %m %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="]"
