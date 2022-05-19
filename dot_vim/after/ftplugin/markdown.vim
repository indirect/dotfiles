" Softwrap
set wrap         " Wrap text
set linebreak    " Wrap at word breaks
set nolist       " List would disable wrap
set textwidth=0  " Use the full screen
set wrapmargin=0 " Wrap at the right margin

" Highlight yaml frontmatter
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
