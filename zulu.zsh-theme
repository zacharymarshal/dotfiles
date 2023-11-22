local ret_status="%(?:%{$fg_bold[green]%}● :%{$fg_bold[red]%}● )"
PROMPT='%m ${ret_status}%{$reset_color%}%D{%H:%M:%S} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="]"
