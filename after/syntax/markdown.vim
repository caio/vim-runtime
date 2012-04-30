" YAML Front Matter
exe 'runtime! syntax/yaml.vim'
unlet! b:current_syntax
syn include @YamlTop syntax/yaml.vim
unlet! b:current_syntax
syn region yamlHead start="\%^---$" end="^---\s*$" keepend contains=@YamlTop,@Spell
