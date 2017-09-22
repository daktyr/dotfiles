# remove fish greeting
set fish_greeting ""

set -x EDITOR vim
set -x ELIXIR_EDITOR atom
set -x BUNDLE_EDITOR vim
# set -x ECTO_EDITOR vim
# set -x ELIXIR_EDITOR "vim +__LINE__ __FILE__"

# turn on history for IEX
set -x ERL_AFLAGS "-kernel shell_history enabled"

if test $TERM = 'xterm'
  set TERM 'xterm-256color'
end


#### Aliases

alias source_fish="source ~/.config/fish/config.fish"

# git
alias gst='git status'
alias gdf='git diff'
alias gdfs='git diff --staged'
alias gcm='git commit -m'
alias gb='git branch'
# __git_complete gb _git_branch
alias glog='git log --oneline --decorate --color --graph'
alias glg='git log'
alias ga='git add'
alias gmg='git merge'
# __git_complete gmg _git_merge
alias gr='git remote'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gfst='gf; and  gst'
alias gckm='git checkout master'
alias gckd='git checkout develop'
alias gck='git checkout'
# __git_complete gck _git_checkout
alias gt='git tree'
alias gcp='git cherry-pick'
alias gsh='git show'
alias grb='git rebase'
# __git_complete grb _git_rebase
alias grbm='git rebase master'
alias grbd='git rebase develop'

#rails
alias rc='rails console'
alias rd='rails destroy'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rs='rails server'
alias rrs='kill -9 `cat tmp/pids/server.pid`; rails server -d' #restart rails server
alias krs='kill -9 `cat tmp/pids/server.pid`' #kill rails server

#rake
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rdc='rake db:create'
alias rds='rake db:seed'
alias rdd='rake db:drop'
alias rr='rake routes'
alias rt='rake test'

#dotfiles
alias bashal='vim ~/.bash_aliases'
alias bashpr='vim ~/.bash_profile'
alias bashenv='vim ~/.bash_env'
alias vimrc='vim ~/.vimrc'

#bundler
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'

#tmux
alias tml="tmux list-sessions"
alias tmk="tmux kill-session -t $1"
alias tma="tmux -2 attach -t $1"

#gems
alias mux="tmuxinator"

#functions
alias olrm='open_last_rails_migration'
alias olem='open_last_ecto_migration'

alias vim='nvim'

#### Functions

function c
    set_color $argv
end

function check_umbrella_deps
  for app in apps/*
    echo (c magenta)(string replace 'apps/' '' $app)(c normal)
    cd $app
    mix hex.outdated
    cd -
  end
end

# open last active record migration
function olrm
  vim db/migrate/(ls db/migrate/ | sort | tail -1)
end

# open last ecto migration
function olem
  vim priv/repo/migrations/(ls priv/repo/migrations/ | sort | tail -1)
end
#### Sources

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish

# source /usr/local/opt/asdf/asdf.fish

source ~/.config/fish/.fish_env.fish
