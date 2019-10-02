Just hit `:PlugInstall` and code away!

## LSP Support

If nodejs is installed, [coc][] is configured. To start it, call `:CocStart`.

[coc]: https://github.com/neoclide/coc.nvim

### Rust

I've only used this setup with rust and it works really well with
[rust-analyzer][ra], so if you have that installed:

  :CocInstall coc-rust-analyzer

Or if you'd rather stick with RLS:

  :CocInstall coc-rls

[ra]: https://github.com/rust-analyzer/rust-analyzer
