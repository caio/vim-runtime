[Caio Romão][]'s VIM Configuration Files
====================================

This is a complete vim runtime environment focused on Python programming
with some helpers for other languages.


Plugins
-------

With help from Tim Pope's [pathogen][] plugin, most of the plugins I use can
be seen on [.gitmodules][] (and you should check there for an updated list
- I won't promise to keep this README up to date). Credits go to these guys,
not me ;)

Submodules:

- [vim-surround][]
[vim-surround]: https://github.com/tpope/vim-surround
- [vim-repeat][]
[vim-repeat]: https://github.com/tpope/vim-repeat
- [vim-speeddating][]
[vim-speeddating]: https://github.com/tpope/vim-speeddating
- [nerdtree][]
[nerdtree]: https://github.com/scrooloose/nerdtree
- [vim-fugitive][]
[vim-fugitive]: https://github.com/tpope/vim-fugitive
- [vim-markdown][]
[vim-markdown]: https://github.com/tpope/vim-markdown
- [vim-git][]
[vim-git]: https://github.com/tpope/vim-git
- [vim-endwise][]
[vim-endwise]: https://github.com/tpope/vim-endwise
- [delimitMate][]
[delimitMate]: https://github.com/Raimondi/delimitMate
- [vim-ruby][]
[vim-ruby]: https://github.com/vim-ruby/vim-ruby
- [vim-cucumber][]
[vim-cucumber]: https://github.com/tpope/vim-cucumber
- [vim-fuzzyfinder][]
[vim-fuzzyfinder]: https://github.com/clones/vim-fuzzyfinder
- [tcomment_vim][]
[tcomment_vim]: https://github.com/tomtom/tcomment_vim
- [neocomplcache][]
[neocomplcache]: https://github.com/Shougo/neocomplcache
- [ack.vim][]
[ack.vim]: https://github.com/mileszs/ack.vim
- [vim-makegreen][]
[vim-makegreen]: https://github.com/reinh/vim-makegreen
- [selfdot.vim][]
[selfdot.vim]: https://github.com/narfdotpl/selfdot.vim
- [syntastic][]
[syntastic]: https://github.com/scrooloose/syntastic
- [syntastic][]
[syntastic]: https://github.com/scrooloose/syntastic
- [clang_complete][]
[clang_complete]: https://github.com/Rip-Rip/clang_complete


Other plugins:

- [number marks][]
[number marks]: http://www.vim.org/scripts/script.php?script_id=2194
- [yankring][]
[yankring]: http://www.vim.org/scripts/script.php?script_id=1234
- [slime][]
[slime]: http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
- [hexHighlight][]
[hexHighlight]: http://www.vim.org/scripts/script.php?script_id=2937
- [renamer.vim][]
[renamer.vim]: http://www.vim.org/scripts/script.php?script_id=1721
- [pyflakes.vim][]
[pyflakes.vim]: http://www.vim.org/scripts/script.php?script_id=2441
- [session.vim][]
[session.vim]: http://www.vim.org/scripts/script.php?script_id=3150


Setup
-----

Clone this repository:

    git clone github://caio.github.com/vim-runtime.git

Then grab the submodules:

    cd vim-runtime
    git submodule update --init

And finally setup your environment:

    cd -
    ln -s vim-runtime ~/.vim
    ln -s vim-runtime/vimrc ~/.vimrc

[pathogen]: http://github.com/tpope/vim-pathogen
[.gitmodules]: http://github.com/caio/vim-runtime/blob/master/.gitmodules
[Caio Romão]: http://blog.caioromao.com
