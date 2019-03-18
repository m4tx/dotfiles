"" General

set number	"" Show line numbers
set linebreak	"" Break lines at word (requires Wrap lines)
set showbreak=+++	"" Wrap-broken line prefix
set textwidth=100	"" Line wrap (number of cols)
set showmatch	"" Highlight matching brace
set visualbell	"" Use visual bell (no beeping)
set noshowmode
 
set hlsearch	"" Highlight all search results
set smartcase	"" Enable smart-case search
set ignorecase	"" Always case-insensitive
set incsearch	"" Searches for strings incrementally
 
set autoindent	"" Auto-indent new lines
set expandtab	"" Use spaces instead of tabs
set shiftwidth=4	"" Number of auto-indent spaces
set smartindent	"" Enable smart-indent
set smarttab	"" Enable smart-tabs
set softtabstop=4	"" Number of spaces per Tab
 
"" Advanced
set ruler	"" Show row and column ruler information
 
set undolevels=1000	"" Number of undo levels
set backspace=indent,eol,start	"" Backspace behaviour

map ; :Files<CR>
map <C-o> :NERDTreeToggle<CR>

""let g:ale_completion_enabled = 1

call plug#begin('~/.config/nvim/plugged')

Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'w0rp/ale'
Plug 'ajh17/vimcompletesme'
Plug 'tpope/vim-surround'

call plug#end()

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif
