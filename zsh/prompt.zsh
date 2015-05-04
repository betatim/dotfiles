autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

virtualenv_prompt_info() {
  if [ -n "$VIRTUAL_ENV" ]; then
    if [ -f "$VIRTUAL_ENV/__name__" ]; then
      local name=`cat $VIRTUAL_ENV/__name__`
    elif [ `basename $VIRTUAL_ENV` = "__" ]; then
      local name=$(basename $(dirname $VIRTUAL_ENV))
    else
      local name=$(basename $VIRTUAL_ENV)
    fi
    echo "($name)"
  fi
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo "($CONDA_DEFAULT_ENV)"
  fi
}

directory_name() {
  #echo "%{$fg_bold[blue]%}%3~%\/%{$reset_color%}"
  echo "%{$fg_bold[blue]%}%12~%{$reset_color%}"
}

user_and_host() {
  echo "%{$fg_bold[green]%}%n@%m%{$reset_color%}"
}

#export PROMPT=$'\n$(directory_name) $(git_dirty)$(need_push)\n› '
export PROMPT=$'\n$(user_and_host) $(directory_name) $(git_dirty)$(need_push)\n$ '

# stop virtualenv from adding to the prompt
export VIRTUAL_ENV_DISABLE_PROMPT="y"

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$(virtualenv_prompt_info)%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
