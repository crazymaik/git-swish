# git-swish

Enhance your command-line experience on Windows with this set of aliases and scripts.
It provides some common aliases when traversing directories, using Git, and numbered file shortcuts for Git.
git-swish is an add-on to [Cmder][1] for Windows.
The idea is based on [SCM Breeze][3] which is available for bash and zsh terminals.

## Installation

[Cmder][1] and [Ruby][2] are required.
No dedicated installation is currently provided.
To install:

1. Clone this Git repository.
2. Copy `clink\git-swish.lua` to `<cmder>\config`.
3. Execute `path\to\repo\bin\git-swish-setup.cmd` in your Cmder terminal whenever you want to use it.

## Usage

### Git File Shortcuts

Whenever you view your git status, each path gets assigned to an environment variable.
Use `gs` to view the enhanced `git status` output.
The files are numbered from 1,2,... and stored in the environment variables `%e1%`,`%e2%`,... .

    $ gs
    #
    # Changes not staged for commit
    #     modified:    [1] lib/git_swish/app.rb
    #     modified:    [2] Gemfile
    #
    $ echo %e1%
    # C:\path\to\repo\lib\git_swish\app.rb
    $

Besides of using the environment variables, the numbers can be used with shortcuts such as `ga` (`git add`).
Instead of typing the full file path, only the number has to be specified.

    $ ga 2
    $ gs
    #
    # Changes to be committed
    #     modified:    [1] Gemfile
    #
    # Changes not staged for commit
    #     modified:    [2] lib/git_swish/app.rb
    #
    $ grs 1

The following shortcuts support number shortcuts:

* `ga`: `git add`
* `gap`: `git add -p`
* `gco`: `git checkout`
* `gd`: `git diff`
* `gds`: `git diff --cached --`
* `grs`: `git reset --`
* `grm`: `git rm`

### More Git Aliases

* `gaa`: `git add -A`
* `gb`: `git branch`
* `gbd`: `git branch -d`
* `gbD`: `git branch -D`
* `gcob`: `git checkout -b`
* `gc`: `git commit`
* `gcm`: `git commit -m `
* `gca`: `git commit --amend`
* `gcah`: `git commit --amend -C HEAD`
* `gps`: `git push`
* `grb`: `git rebase`
* `grbi`: `git rebase -i`
* `gru`: `git remote update -p`

### Aliases for Traversing Directories

* `..`: `cd ..`
* `...`: `cd ..\..`
* `..X` where `X` is a digit: Travers `X` number of directories up.
* `c <dir>` : Change into `<dir>` and print directory contents.

## Contributing

1. Fork it ( https://github.com/crazymaik/git-swish/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

    Copyright 2014 Michael Zoech

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

[1]: http://bliker.github.io/cmder/
[2]: http://rubyinstaller.org/
[3]: https://github.com/ndbroadbent/scm_breeze
