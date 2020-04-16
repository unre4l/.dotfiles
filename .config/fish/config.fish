#set -gx PATH ~/bin $PATH

if status is-interactive
and not set -q TMUX
    set -g TMUX tmux new-session -d -s 🏄
    eval $TMUX
    tmux attach-session -d -t 🏄
end

set fish_greeting
set SPACEFISH_PROMPT_ORDER time user dir host git exec_time line_sep jobs exit_code char

alias dup 'docker-compose up -d'
alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias e 'nautilus'
alias gs 'git status'

function gbda -d "Delete all branches merged in current HEAD"
  git branch --merged | \
    command grep -vE  '^\*|^\s*(master|develop)\s*$' | \
    command xargs -n 1 git branch -d
end

if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end
