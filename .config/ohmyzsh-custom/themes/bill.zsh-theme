# Check if in git repo in unignored directory.
check_git() {
    git check-ignore -q . 2> /dev/null
    (( is_git = $? == 1 ))
}
chpwd_functions+=(check_git)

# Create prompt
custom_git_prompt() {
    if (( is_git )); then
        echo -e "\n$(git_super_status)"
    fi
}

PROMPT="
%{$fg[blue]%}%n%{$reset_color%} %{$fg[yellow]%}%m%{$reset_color%} %{$fg[red]%}%~%{$reset_color%}"
PROMPT+='$(custom_git_prompt)'
PROMPT+="
%{$fg[blue]%}%D %*%{$reset_color%}
%(?..%{$fg_bold[red]%}%?%{$reset_color%} )%{$fg[cyan]%}%!%{$reset_color%} %{$fg[green]%}>>%{$reset_color%} "

# No prompt to the right
RPROMPT=""

# Decorations
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}%{(%G%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}%{)%G%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg_bold[white]%}%{|%G%}"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{S%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{X%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[blue]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{!%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{U%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR="->"
