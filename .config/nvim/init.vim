" required
"" nobackup
set nobackup
set noswapfile

"" appearance
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
syntax on

"" font config
" set ambiwidth=double

"" Tab
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab

"" key remap
nnoremap j gj
nnoremap k gk

"" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ============== dein =================
let s:python2_host_path = '/usr/bin/python'
let s:python3_host_path = '/usr/local/Cellar/python3/3.6.2/bin'
let g:python_host_prog = system(s:python2_host_path)
let g:python3_host_prog = system(s:python3_host_path)

let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml = s:dein_config_dir . '/dein.toml'
let s:toml_lazy = s:dein_config_dir . '/dein_lazy.toml'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)
  
  " Load from toml
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" truecolor¬
set termguicolors

" Color theme
colorscheme tender

