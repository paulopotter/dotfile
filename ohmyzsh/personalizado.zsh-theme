PROMPT='%{${fg[cyan]}%}$(get_pwd)$reset_color $(git_prompt_info)
%{${fg[red]}%}::%{${reset_color}%} %{%}'

function get_pwd() {
    echo "${PWD/$HOME/~}"
}


function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">"
ZSH_THEME_GIT_PROMPT_DIRTY="%{${fg[red]}%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
