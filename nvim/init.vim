set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()

source ~/.config/nvim/.vimrc
