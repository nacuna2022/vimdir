set encoding=utf-8

" we check to see if Vundle already exists, before loading it
"if finddir(".vim/bundle/Vundle.vim", "$HOMEDIR") == ".vim/bundle/Vundle.vim"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'ryanoasis/vim-devicons'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'chrisbra/unicode.vim'
Plugin 'mg979/vim-visual-multi'
"Plugin 'jceb/vim-orgmode'
"Plugin 'tpope/vim-speeddating'
Plugin 'vimwiki/vimwiki'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"endif "if vundle exists"


autocmd FileType make setlocal noexpandtab

syntax on

colorscheme inkpot


let g:airline_theme='simple'
let g:airline_powerline_fonts=1

set nowrap
set ruler
set backspace=2
set backspace=indent,eol,start

set tabstop=8
set shiftwidth=8
set expandtab "for converting tabs to spaces
"set noexpandtab "for not converting tabs to spaces

set cc=80
set smartindent


"select fonts by typing set guifont=*

"set guifont=Consolas:h10:cANSI
"set guifont=Inconsolata:h10:cANSI
"set guifont=FiraMono\Nerd\ Font\ 10

set hlsearch

"remove arrows keys bindings - they are annoying
noremap <Up> <nop>
noremap <Down> <nop>
noremap  <Left> <nop>
noremap <Right> <nop>

" map F5 to today's date in insert mode
inoremap <F5> <C-R>=strftime("[%b-%d-%Y %a]")<CR>

set guioptions-=m "remove menu bar
set guioptions-=T "remove tool bar
set guioptions-=r " remove right hand scrollbar

nnoremap <silent> <F8> :TlistToggle<CR>
"nnoremap <F12> :Explore<CR>
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F11> :TagbarToggle<CR>
"nnoremap <F10> :YcmCompleter GoToInclude<CR>
nnoremap <F10> :FZF<CR>

set number

" window resizing stuff
nnoremap <silent> <C-h> :vertical resize -3<CR>
nnoremap <silent> <C-l> :vertical resize +3<CR>

nnoremap <silent> <C-j> :res -3<CR>
nnoremap <silent> <C-k> :res +3<CR>

"status line 
set laststatus=2
set statusline=
set statusline+=%f%m
set statusline+=%=%y\ %l,%c\ %p%%\  

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


let g:netrw_liststyle = 3

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" orgmode settings
let g:org_prefer_insert_mode = 0
let g:org_aggressive_conceal = 0
let g:org_indent = 1
let g:org_todo_keywords = [['TODO(t)', 'INPROGRESS(i)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]


" vimwiki settings

" define my own wiki on the usual "custom" git repo
let main_wiki = {}
let main_wiki.path = '~/git/vimwiki/'
let g:vimwiki_list = [main_wiki]
