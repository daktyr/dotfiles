set fish_greeting ""
set fish_color_autosuggestion brmagenta

set -x EDITOR nvim
set -x ELIXIR_EDITOR atom
set -x BUNDLE_EDITOR nvim
# set -x ECTO_EDITOR vim
# set -x ELIXIR_EDITOR "vim +__LINE__ __FILE__"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'

# turn on history for IEX
set -x ERL_AFLAGS "-kernel shell_history enabled"

# plugins env varaibles
set -gx PROJECT_PATHS ~/Projects

#### Abbrevations
if not set -q fish_initialized
  set -U fish_initialized

  abbr -a pjo pj open

  abbr -a be bundle exec
  abbr -a bi bundle install
  abbr -a bu bundle update
  abbr -a rc rails console
  abbr -a rd rails destroy
  abbr -a rdc rails db:create
  abbr -a rdm rails db:migrate
  abbr -a rdr rails db:rollback
  abbr -a rds rails db:seed
  abbr -a rgg rails generate
  abbr -a rgm rails generate migration
  abbr -a rr rails routes
  abbr -a rs rails server

  abbr -a ga git add
  abbr -a gb git branch
  abbr -a gck git checkout
  abbr -a gckd git checkout develop
  abbr -a gckm git checkout master
  abbr -a gcm git commit -m
  abbr -a gcp git cherry-pick
  abbr -a gdf git diff
  abbr -a gf git fetch
  abbr -a glg git log
  abbr -a glog git log --oneline --decorate --color --graph
  abbr -a gmg git merge
  abbr -a gp git push
  abbr -a gpl git pull
  abbr -a gr git remote
  abbr -a grb git rebase
  abbr -a grbd git rebase develop
  abbr -a grbm git rebase master
  abbr -a gsh git show
  abbr -a gst git status
  abbr -a gt git tree

  abbr -a mdg mix deps.get
  abbr -a mdu mix deps.update
  abbr -a mec mix ecto.create
  abbr -a megm mix ecto.gen.migration
  abbr -a mem mix ecto.migrate
  abbr -a mems mix ecto.migrations
  abbr -a mer mix ecto.rollback
  abbr -a mpgc mix phx.gen.context
  abbr -a mpgh mix phx.gen.html
  abbr -a mpgj mix phx.gen.json
  abbr -a mpgs mix phx.gen.schema
  abbr -a mpr mix phx.routes
  abbr -a mps mix phx.server
end

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish

# set -g -x PATH $PATH "$HOME/.cargo/bin"

source ~/.config/fish/.fish_env.fish
