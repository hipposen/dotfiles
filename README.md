Vim installation
================

Install Vundle:

```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Symlink vimrc:

```bash
ln -s /path/to/dotfiles/.vimrc ~/.vimrc
```

Initialize Vundle Plugins with `:PluginInstall` inside vim.

Install YouCompleteMe:

```bash
cd  ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```
