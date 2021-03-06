# git-swish

Enhance your Git command-line experience on Windows with this set of aliases and scripts.
The idea behind this project is based on [SCM Breeze][3] which is available for bash and zsh terminals.
git-swish provides the following features:

* Aliases for git commands.
* Numbered file shortcuts.
* Prompt completion when used in Cmder.

## Installation

A [Ruby][2] installation is required and `ruby.exe` needs to be available on the `PATH`.
Use [Cmder][1] if you want to take advantage of prompt completion.
No dedicated installation is currently provided.
To install:

1. Clone this Git repository.
2. (Optional) Copy `clink\git-swish.lua` to `<cmder>\config`.

In your command prompt execute `path\to\repo\bin\git-swish-setup.cmd` whenever you want to use git-swish.

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

Use number ranges to reference a range of files.

    $ ga 1-4
    $ gs
    #
    # Changes to be committed
    #     modified:    [1] Gemfile
    #     modified:    [2] README.md
    #     modified:    [3] LICENSE.txt
    #     modified:    [4] lib/git_swish/app.rb
	$

The following shortcuts support numbered files and numbered ranges:

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

## Contributing

1. Fork it ( https://github.com/crazymaik/git-swish/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

    Copyright 2016 Michael Zoech

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
