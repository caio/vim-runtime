Caio Romão's VIM Configuration Files
====================================

This is a complete vim runtime environment focused on Python programming
and with growing focus on other languages like Scala, node.js and ruby.


Plugins
-------

Every plugin is managed by [vundle][]. You can check the full list by
reading the `vimrc` file from [here][plugins-begin] to [here][plugins-end].

[vundle]: https://github.com/gmarik/vundle
[plugins-begin]: https://github.com/caio/vim-runtime/blob/master/vimrc#L4
[plugins-end]: https://github.com/caio/vim-runtime/blob/master/vimrc#L59

Setup
-----

1. Clone this repository:

    ```bash
    git clone github://caio.github.com/vim-runtime.git
    ```

2. Then grab the submodules:

    ```bash
    cd vim-runtime
    git submodule update --init
    ```

3. Setup your environment:

    ```bash
    cd -
    ln -s vim-runtime ~/.vim
    ln -s vim-runtime/vimrc ~/.vimrc
    ```

4. Open vim/gvim/mvim/whatever and have vundle download the plugins

    ```bash
    vim
    ```

    ```viml
    :BundleInstall
    ```

5. Profit!
