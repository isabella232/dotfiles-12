# My ~/ configuration

## dotfiles

There are my home's config files, which I use to do mostly system administration and shell/Ruby scripting.

If you don't use Vim or RVM, there is nothing really interesting to dig here.

## install

Run this:

```sh
git clone https://github.com/josqu4red/dotfiles.git ~/wherever
cd ~/wherever
rake
```

3 tasks will be done:

* Symlink each file in "files/" to ~/.file
* Create a RVM gemset for each Gemfile in "gemsets/" (skipped if RVM isn't found)
* Fetch each Vim plugin from "vim_plugins" (pathogen.vim is already included in this repo)

"files/gitconfig" contains my name, so you'll probably want to change that.

## Credits

The symlink way is inspired from Zach Holman's [dotfiles](http://github.com/holman/dotfiles)

Vim plugins are easy to manage thanks to Tim Pope's [vim-pathogen](https://github.com/tpope/vim-pathogen)
