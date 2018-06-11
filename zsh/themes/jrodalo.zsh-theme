local ret_status="%(?:%{$fg_bold[yellow]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
PROMPT='
%{$fg[green]%}%~%{$reset_color%} $(git_prompt_info)
${ret_status} %{$fg[white]%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
