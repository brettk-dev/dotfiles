" General
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set visualbell		" Use visual bell (no beeping)

set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set incsearch		" Searches for strings incrementally

set autoindent		" Auto-indent new lines
set expandtab		" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smarttab		" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

" Advanced
set ruler		" Show row and column ruler information
set showtabline=2	" Show tab bar

set undolevels=1000	" Number of undo levels


" Generated by VimConfig.com

filetype plugin on

" Packer auto-compile
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

lua require('plugins')


" ALE
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 0

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier'],
\ 'javascriptreact': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'vue': ['prettier'],
\}

" statusline
:set statusline=%f\ %y\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P
