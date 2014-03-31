# bundler plugin
#
# Author: Jeremy Olliver <jeremy.olliver@gmail.com>
#

alias bi="bundle install"
alias be="bundle exec"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias brake="bundle exec rake"

# The following is based on https://github.com/gma/bundler-exec

if ((! $+bundled_commands)); then
  bundled_commands=(
    annotate
    berks
    cap
    capify
    chefspec
    chef-apply
    chef-client
    chef-shell
    chef-solo
    cucumber
    foodcritic
    foreman
    guard
    knife
    middleman
    nanoc
    pry
    rackup
    rainbows
    rails
    rake
    rspec
    shotgun
    spec
    spork
    thin
    thor
    unicorn
    unicorn_rails
  )
fi

## Functions

_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=$PWD
  while [ $check_dir != "/" ]; do
    [ -f "$check_dir/Gemfile" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-bundler() {
  if _bundler-installed && _within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

## Main program
for cmd in $bundled_commands; do
  eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"
  alias $cmd=bundled_$cmd

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd bundled_$cmd=$cmd
  fi
done
