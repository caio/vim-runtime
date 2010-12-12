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

- [ack.vim][]
- [clang_complete][]
- [delimitMate][]
- [neocomplcache][]
- [nerdtree][]
- [selfdot.vim][]
- [syntastic][]
- [syntastic][]
- [tcomment_vim][]
- [vim-cucumber][]
- [vim-endwise][]
- [vim-fugitive][]
- [vim-fuzzyfinder][]
- [vim-git][]
- [vim-makegreen][]
- [vim-markdown][]
- [vim-repeat][]
- [vim-ruby][]
- [vim-speeddating][]
- [vim-surround][]


Other plugins:

- [hexHighlight][]
- [number marks][]
- [pyflakes.vim][]
- [renamer.vim][]
- [session.vim][]
- [slime][]
- [yankring][]


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

[Caio Romão]: http://blog.caioromao.com
[.gitmodules]: http://github.com/caio/vim-runtime/blob/master/.gitmodules
[ack.vim]: https://github.com/mileszs/ack.vim
[clang_complete]: https://github.com/Rip-Rip/clang_complete
[delimitMate]: https://github.com/Raimondi/delimitMate
[hexHighlight]: http://www.vim.org/scripts/script.php?script_id=2937
[neocomplcache]: https://github.com/Shougo/neocomplcache
[nerdtree]: https://github.com/scrooloose/nerdtree
[number marks]: http://www.vim.org/scripts/script.php?script_id=2194
[pathogen]: http://github.com/tpope/vim-pathogen
[pyflakes.vim]: http://www.vim.org/scripts/script.php?script_id=2441
[renamer.vim]: http://www.vim.org/scripts/script.php?script_id=1721
[selfdot.vim]: https://github.com/narfdotpl/selfdot.vim
[session.vim]: http://www.vim.org/scripts/script.php?script_id=3150
[slime]: http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
[syntastic]: https://github.com/scrooloose/syntastic
[syntastic]: https://github.com/scrooloose/syntastic
[tcomment_vim]: https://github.com/tomtom/tcomment_vim
[vim-cucumber]: https://github.com/tpope/vim-cucumber
[vim-endwise]: https://github.com/tpope/vim-endwise
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-fuzzyfinder]: https://github.com/clones/vim-fuzzyfinder
[vim-git]: https://github.com/tpope/vim-git
[vim-makegreen]: https://github.com/reinh/vim-makegreen
[vim-markdown]: https://github.com/tpope/vim-markdown
[vim-repeat]: https://github.com/tpope/vim-repeat
[vim-ruby]: https://github.com/vim-ruby/vim-ruby
[vim-speeddating]: https://github.com/tpope/vim-speeddating
[vim-surround]: https://github.com/tpope/vim-surround
[yankring]: http://www.vim.org/scripts/script.php?script_id=1234
