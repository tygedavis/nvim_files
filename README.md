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
Install tmux using `brew install tmux`. Then source your tmux file using `tmux source ~/.tmux.conf`.

### tmux plugins
If you don't already, add the [tpm](https://github.com/tmux-plugins/tpm) repo to your .tmux/config
After that, source the .tmux file and install the plugins using prefix + I. Note, for the catpuccino theme to work properly, you may need to install a Nerd Font. I recommend [Commit Mono](https://www.programmingfonts.org/#commit-mono)

## Custom Keybinds to Remember
 - This is a placeholder for now.
