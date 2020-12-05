" " YAML Front Matter
unlet! b:current_syntax
syn include @YamlTop syntax/yaml.vim
syn region yamlHead start="\%^---$" end="^---\s*$" keepend contains=@YamlTop

" Config/kinda-TOML Front Matter
unlet! b:current_syntax
syn include @ConfigTop syntax/config.vim
syn region Comment start="\%^+++$" end="^+++\s*$" keepend contains=@ConfigTop

let b:current_syntax="markdown"
