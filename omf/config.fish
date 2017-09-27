set fish_greeting ""
set fish_color_autosuggestion brmagenta

set -x EDITOR nvim
set -x ELIXIR_EDITOR atom
set -x BUNDLE_EDITOR nvim
# set -x ECTO_EDITOR vim
# set -x ELIXIR_EDITOR "vim +__LINE__ __FILE__"

# turn on history for IEX
set -x ERL_AFLAGS "-kernel shell_history enabled"

# plugins env varaibles
set -gx PROJECT_PATHS ~/Projects

#### Abbrevations

abbr -a pjo pj open

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish

source ~/.config/fish/.fish_env.fish
