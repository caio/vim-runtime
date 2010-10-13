Caio Romão's VIM Configuration Files
====================================

This is a complete vim runtime environment focused on Python programming
with some helpers for other languages.


Plugins
-------

With help from Tim Pope's [pathogen][1] plugin, most of the plugins I use
can be seen on [.gitmodules][6]. Credits go to these guys, not me ;)

Other notable plugins are:

- [number marks][2]
- [yankring][4]
- [slime][5]


Setup
-----

Clone this repository:

    git clone github://caio.github.com/vim-runtime.git

Then grab the submodules:

    cd vim-runtime
    git submodule init
    git submodule update

And finally setup your environment:

    cd -
    ln -s vim-runtime ~/.vim
    ln -s vim-runtime/vimrc ~/.vimrc

[1]: http://github.com/tpope/vim-pathogen
[2]: http://www.vim.org/scripts/script.php?script_id=2194
[4]: http://www.vim.org/scripts/script.php?script_id=1234
[5]: http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
[6]: http://github.com/caio/vim-runtime/blob/master/.gitmodules
