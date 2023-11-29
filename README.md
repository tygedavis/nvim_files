# Files that I use in my NeoVim configuration

## Where to put these files
Use symlinks to add a file copy in the correct location.
Any questions about creating the symlink, refer to [this Stack Exchange answer](https://superuser.com/questions/422473/vim-doesnt-load-symlinked-vimrc).

**.vimrc** `ln -s {path to}/nvim_files/vimrc ~/.vimrc`

**.tmux.conf** `ln -s {path to}/nvim_files/tmux.conf ~/.tmux.conf`

## Setup Instructions
### .vimrc
#### Linking your .vimrc file to your neovim config
Inside of Neovims init.vim file (~/.config/nvim/init.vim most likely)
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
#### Installing Plugged
[Github URL](https://github.com/junegunn/vim-plug) with all of the intructions to install. You should only need to install Plugged to your machine, the work needed for the .vimrc file should already be done.
Remember to run `:PlugInstall` inside of neovim to install the plugins in the .vimrc file.

## .tmux.conf
All you should need to do is run `brew install tmux`. Then source your tmux file using `tmux source ~/.tmux.conf` and you're good to go.
