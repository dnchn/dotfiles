[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function


# separate file for aliases
if [[ -r ~/.zsh/.aliasrc ]]; then
  . ~/.zsh/.aliasrc
fi

bindkey -v #set to vi mode
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_CD
setopt CORRECT

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
rvm default 1.9.2

PATH=$PATH
function precmd {
# let's get the current get branch that we are under
# ripped from /etc/bash_completion.d/git from the git devs
git_ps1 () {
  if which git &> /dev/null; then
    local g="$(git rev-parse --git-dir 2>/dev/null)"
    if [ -n "$g" ]; then
      local r
      local b
      if [ -d "$g/rebase-apply" ]; then
        if test -f "$g/rebase-apply/rebasing"; then
          r="|REBASE"
        elif test -f "$g/rebase-apply/applying"; then
          r="|AM"
        else
          r="|AM/REBASE"
        fi
        b="$(git symbolic-ref HEAD 2>/dev/null)"
      elif [ -f "$g/rebase-merge/interactive" ]; then
        r="|REBASE-i"
        b="$(cat "$g/rebase-merge/head-name")"
      elif [ -d "$g/rebase-merge" ]; then
        r="|REBASE-m"
        b="$(cat "$g/rebase-merge/head-name")"
      elif [ -f "$g/MERGE_HEAD" ]; then
        r="|MERGING"
        b="$(git symbolic-ref HEAD 2>/dev/null)"
      else
        if [ -f "$g/BISECT_LOG" ]; then
          r="|BISECTING"
        fi
        if ! b="$(git symbolic-ref HEAD 2>/dev/null)"; then
          if ! b="$(git describe --exact-match HEAD 2>/dev/null)"; then
            b="$(cut -c1-7 "$g/HEAD")..."
          fi
        fi
      fi
      if [ -n "$1" ]; then
        printf "$1" "${b##refs/heads/}$r"
      else
        printf "%s" " G:${b##refs/heads/}$r"
      fi
    fi
  else
    printf ""
  fi
}

PR_GIT="$(git_ps1)"

# The following 9 lines of code comes directly from Phil!'s ZSH prompt
# http://aperiodic.net/phil/prompt/
local TERMWIDTH
(( TERMWIDTH = ${COLUMNS} - 1 ))

local PROMPTSIZE=${#${(%):--- %D{%R.%S %a %b %d %Y}\! }}
local PWDSIZE=${#${(%):-%~}}

if [[ "$PROMPTSIZE + $PWDSIZE" -gt $TERMWIDTH ]]; then
  (( PR_PWDLEN = $TERMWIDTH - $PROMPTSIZE ))
fi
}


# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets

function zle-line-init zle-keymap-select {
VIMODE="${${KEYMAP/vicmd/CMD}/(main|viins)/}"
zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

setprompt () {
  # Need this, so the prompt will work
  setopt prompt_subst

  autoload -U colors && colors

  # Finally, let's set the prompt
  PROMPT='%{$fg_bold[magenta]%}!%h \
%{$fg_bold[green]%}%~ \
%{$fg[red]%}${VIMODE}%{$fg[cyan]%}>\
%{$reset_color%} '

  # Of course we need a matching continuation prompt
  PROMPT2='\
%{$fg[green]%}>\
%{$fg[white]%}%_%{$fg[green]%}> %{$reset_color%}}'

  RPS1='%{$fg_bold[red]%}${PR_GIT} %{$reset_color%}'
}

setprompt

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
  # echo works in bash & zsh
  local mode=$1 ; shift
  echo -ne "\033]$mode;$@\007"
}
stt  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# No dups in history
setopt histignorealldups
setopt hist_verify
setopt PUSHD_IGNORE_DUPS
setopt AUTO_PUSHD
# history search
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
