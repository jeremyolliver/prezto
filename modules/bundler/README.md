# Bundler Plugin

Provides seamless background integration for the ruby dependency resolver [Bundler][1]
Heavily borrowed from the [Oh My Zsh plugin for bundler](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/bundler) and it's original inspiration [bundler-exec](https://github.com/gma/bundler-exec)
Does not include zsh completion for bundler

Author: Jeremy Olliver <jeremy.olliver@gmail.com>

# Features

provides aliases for common bundler commands:

* `bi` = `bundle install`
* `be` = `bundle exec` (e.g. `be rake`)
* `bl` = `bundle list`
* `bp` = `bundle package`
* `bu` = `bundle update`
* `brake` = `bundle exec rake`

Automatically pre-pends a set list of command with `bundle exec` if a Gemfile is present (e.g. if bundler is used in a given directory)
This is achieved by replacing the command with a shell function which checks for the prescence of a Gemfile.

The list of commands to execute under bundler is defined as `$bundled_commands`. If you like you can define this prior to the plugins initialization to override.

- - -

[1]: http://bundler.io/
